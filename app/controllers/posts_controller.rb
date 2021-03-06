class PostsController < ApplicationController
before_action :get_user, :authenticate, :current_user

def index
  @posts = Post.all
end

def new
  @comment = Comment.new(post_id: params[:post_id])
end

def show
  @post = Post.find_by_id(params[:post_id])
  post = current_user

end

def create

      @user = User.find_by_id(params[:user_id])
      @post = @user.posts.create(post_params)
      redirect_to @user
    end

def destroy
@post = Post.find_by_id(params [:post_id])
@post.destroy
redirect_to @user
end

private
def post_params
  params.permit(:body, :title, :user_id)
end

def get_user
  @user = User.find_by_id(params[:id])
end

def current_user
  @current_user ||= User.find_by_id(session[:user_id])
end

end
