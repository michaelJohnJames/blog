class PostsController < ApplicationController
before_action :get_user

def new
  @post = Post.new
end

def create
      @user = User.find_by_id(params[:user_id])
      @post = @user.posts.create(post_params)
      redirect_to @user
    end

private
def post_params
  params.permit(:body, :title, :user_id)
end

def get_user
  @user = User.find_by_id(params[:id])
end

end
