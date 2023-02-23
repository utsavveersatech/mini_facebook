class RequestsController < ApplicationController

  # def friend_request
  #   requests = Relationship.where(following_id: current_user.id, request_approved: false)
  #   @requests = []
  #   requests.each { |r| @requests.append(r.follower)}
  # end

  # def accept_request
  #   request = Relationship.where(follower_id: params[:follower_id], following_id: current_user.id, request_approved: false)
  #   if request.update(request_approved: true)
  #     redirect_to friendRequest_path
  #   end
  # end

  # def reject_request
  #   request = Relationship.where(follower_id: params[:follower_id], following_id: current_user.id, request_approved: false)
  #   if Relationship.destroy(request.ids)
  #     redirect_to friendRequest_path
  #   end
  # end

  def index
    requests = Relationship.where(following_id: current_user.id, request_approved: false)
    @requests = []
    requests.each { |r| @requests.append(r.follower)}
  end

  def update
    request = Relationship.where(follower_id: params[:id], following_id: current_user.id, request_approved: false)
    if request.update(request_approved: true)
      render "index"
    end
  end

  def destroy
    request = Relationship.where(follower_id: params[:id], following_id: current_user.id, request_approved: false)
    if Relationship.destroy(request.ids)
      render "index"
    end
  end

end