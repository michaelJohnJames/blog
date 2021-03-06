class UsersController < ApplicationController

  before_action :authenticate, :current_user, only: [:update, :edit, :show]

  def index
    @users = User.all
    @user = User.find_by_id([:id])
    @posts = Post.all
  end

  def show
    @user = User.find_by_id(session[:user_id])
    user = @user
    @post = Post.find_by_id(params[:post_id])
  end

  def new
    redirect_to '/signup', notice: "You're already logged in" if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup', notice: "An error prevented sign up: #{@user.errors.full_messages.join('. ')}"
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    params.permit(:username, :password, :location, :f_name, :l_name, :description)

  end



  def update
    #@user = User.find_by_id(:id)
    @user = current_user
    @user.update_attributes(user_params)
    @user.save(user_params)
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit, notice: "Please enter your password!"
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:id, :username, :password, :location, :f_name, :l_name, :description)
  end

  def get_user
  @user = User.find_by_id(params[:id])
end
end
