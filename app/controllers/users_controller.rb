class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users =@q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @likes = @user.likes
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      remember user
      flash[:notice] = "#{user.name}さん、ようこそRyugakugramへ！"
      redirect_to user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user
    else
      render :edit
    end
  end

  def following
    user = User.find(params[:id])
    @following = user.following
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :passwrod_confirmation, :profile, :country, :image)
  end
end
