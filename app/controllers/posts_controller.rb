class PostsController < ApplicationController

  #displays all posts
  def index
    @posts = Post.order(created_at: :desc)
  end

  #returns html form for new post
  def new
  end

  #creates new post with post request
  def create
    @post = Post.new(params.require(:post).permit(:title, :icon, :entry, :published))
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  #returns an HTML form for editing specific post.
  def edit
    @post = Post.find(params[:id])
  end

  #handles the put request to edit spec post.
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :icon, :entry, :published))
      redirect_to root_path
    else
      render :edit_post
    end
  end

  #deletes a specific post
  def delete
    @post = Post.destroy(params[:id])
    redirect_to "/"
  end

  # private
  #   def post_params
  #     @post_params = params.require(:post).permit(:title, :icon, :entry)
  #   end
end
