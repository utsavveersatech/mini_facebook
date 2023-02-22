class HomeController < ApplicationController

  def index
    if current_user
      puts current_user.email
    end
  end

  def find_friends
    user = User.all()
    following = current_user.followings
    @users = user - following - [current_user]
  end

  def add_friends
    user = User.find(params[:id])
    rel = Relationship.new(follower_id: current_user.id, following_id: params[:id], request_approved: false)
    if rel.save
      redirect_to findFriends_path
    end
  end

  def get_followings
    # @followings = current_user.followings
    followings = Relationship.where(follower_id: current_user.id, request_approved: true)
    following = []
    followings.each { |f| following.append(f.following)}
    @followings = following
  end

  def get_followers
    # @followers = current_user.followers
    followers = Relationship.where(following_id: current_user.id, request_approved: true)
    follower = []
    followers.each { |f| follower.append(f.follower)}
    @followers = follower
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

  def unfriend
    friend = Relationship.where(follower_id: current_user.id, following_id: params[:following_id], request_approved: true)
    if Relationship.destroy(friend.ids)
      redirect_to getFollowings_path
    end
  end
end
