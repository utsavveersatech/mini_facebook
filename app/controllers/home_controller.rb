class HomeController < ApplicationController

  def get_followings
    # followings = Relationship.where(follower_id: current_user.id, request_approved: true)
    # following = []
    # followings.each { |f| following.append(f.following)}
    # @followings = following

    @followings = Relationship.joins(:follower).where("follower_id=?  and request_approved =true",current_user.id)
    @followings = @followings.map{ |follow| follow.following}
  end

  def get_followers
    # followers = Relationship.where(following_id: current_user.id, request_approved: true)
    # follower = []
    # followers.each { |f| follower.append(f.follower)}
    # @followers = follower

    @followers = Relationship.joins(:follower).where("following_id=?  and request_approved =true",current_user.id)
    @followers = @followers.map{ |follow| follow.follower}
  end

  def unfriend
    friend = Relationship.where(follower_id: current_user.id, following_id: params[:following_id], request_approved: true)
    if Relationship.destroy(friend.ids)
      redirect_to get_followings_path
    end
  end
end
