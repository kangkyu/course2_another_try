class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end