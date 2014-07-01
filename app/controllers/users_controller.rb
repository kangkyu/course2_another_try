class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry

    @user = User.new(username: params[:username], password: params[:password])

    if @user.save
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