class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  def create
    session_params = params.permit(:email, :password)
    @user = User.find_by(session_params)
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice]   = "Invalid Login"
      redirect_to new_session_path
    end
  end

  def logout
    p session[:user_id]
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to users_path
  end
end