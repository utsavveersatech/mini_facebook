class PostsController < ApplicationController

  #get all post
  def index
    @posts = Post.all
  end

  def new
  end

  # create new post
  def create
    post = Post.new(title: params[:post][:title], description: params[:post][:description])
    post.users = [current_user]
    if post.save
      redirect_to posts_path
    end
  end

  # update post
  def update
    post = Post.find(params[:id])
    post.update(title: params[:title], description: params[:description], imageUrl: params[:imageUrl])
    if post.save
      redirect_to posts_path
    end
  end

  # delete post
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path
    end
  end

end
