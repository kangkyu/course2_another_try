class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(username: params[:username]).take

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id   # save user_id to session
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil   # remove user_id from session
    redirect_to root_path
  end
end
