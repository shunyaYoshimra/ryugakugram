class PostsController < ApplicationController
  def index
    @posts = Post.all
    @like = @post
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
    @comments = @post.comments
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:content, :picture)
  end
end
