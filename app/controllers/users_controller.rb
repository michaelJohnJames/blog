class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
