class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def create
    @user = User.create!(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to users_url
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_user_path
    end
  end

  def index
    p users = User.all
    respond_to do |format|
      format.html 
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html { render 'users/signup' }
    end
  end

  def signup
    respond_to do |format|
      format.html { render 'users/signup' }
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confiramtion)
  end
end