class RequestsController < ApplicationController

  before_action :set_request, only: %i[update destroy]

  def index
    # requests = Relationship.where(following_id: current_user.id, request_approved: false)
    # @requests = []
    # requests.each { |r| @requests.append(r.follower)}
    @requests = Relationship.joins(:follower).where("following_id=?  and request_approved =false",current_user.id)
    @requests = @requests.map { |user| user.follower}
  end

  def update
    if @request.update(request_approved: true)
      render "index"
    end
  end

  def destroy
    if Relationship.destroy(@request.ids)
      render "index"
    end
  end

  private 

    def set_request
      @request = Relationship.where(follower_id: params[:id], following_id: current_user.id, request_approved: false)
    end

end