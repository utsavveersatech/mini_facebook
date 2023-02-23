class FriendsController < ApplicationController

  def index
    user = User.all()
    following = current_user.followings
    @users = user - following - [current_user]
  end

  def create
    user = User.find(params[:id])
    rel = Relationship.new(follower_id: current_user.id, following_id: params[:id], request_approved: false)
    if rel.save
      redirect_to friends_path
    end
  end

  def friend_request
    requests = Relationship.where(following_id: current_user.id, request_approved: false)
    @requests = []
    requests.each { |r| @requests.append(r.follower)}
  end

  def accept_request
    request = Relationship.where(follower_id: params[:follower_id], following_id: current_user.id, request_approved: false)
    if request.update(request_approved: true)
      redirect_to friendRequest_path
    end
  end

  def reject_request
    request = Relationship.where(follower_id: params[:follower_id], following_id: current_user.id, request_approved: false)
    if Relationship.destroy(request.ids)
      redirect_to friendRequest_path
    end
  end


end