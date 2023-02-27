class PostsController < ApplicationController

  #get all post
  def index
    # rel = Relationship.where(follower_id: current_user.id, request_approved: true)
    # followings = []
    # for r in rel
    #   followings.append(User.find(r.following_id))
    # end
    
    # @posts = []
    # for following in followings
    #   @posts.concat(following.posts)
    # end
    
    followings = Relationship.joins(:follower).where("follower_id=?  and request_approved =true",current_user.id)
    @posts = followings.map{ |follow| follow.following.posts}
    @posts = @posts.first
  end

  def new
  end

  # create new post
  def create
    post = Post.new(title: params[:post][:title], description: params[:post][:description])
    post.user = current_user
    if post.save
      redirect_to root_path
    end
  end

  # update post
  def update
    @post = Post.find(params[:id])
    @post.update(title: params[:post][:title], description: params[:post][:description], imageUrl: params[:imageUrl])
    if @post.save
      redirect_to posts_path
    end
  end

  # delete post
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

end
