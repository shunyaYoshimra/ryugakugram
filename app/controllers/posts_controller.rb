class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post
    else
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:content, :picture)
  end
end
