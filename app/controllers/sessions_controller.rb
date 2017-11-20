class SessionsController < ApplicationController
before_action :authenticate, only: [:show]

  def new
    redirect_to '/', notice: "You are already logged in" if logged_in?
  end

  def create
  @user = User.find_by_username(params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to '/'
  else
    redirect_to '/signin', notice: 'Username unknown or password.'
  end
end

def logout
    session.clear
    redirect_to '/signin', notice: 'You are logged out!'
end

end
