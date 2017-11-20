class UsersController < ApplicationController

  def index

    @users = User.all
    @user = User.find_by_id([:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render '/users/new'
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :location, :f_name, :l_name, :description)
  end
end
