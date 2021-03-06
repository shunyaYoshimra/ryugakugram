class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      remember user
      redirect_to user
    else
      render :new
    end
  end

  def destroy
    reset_session
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email,:password)
  end
end
