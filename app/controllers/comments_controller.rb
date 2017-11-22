class CommentsController < ApplicationController
  before_action :get_post, :authenticate, :current_user

def index
  @comments = Comment.all
end

  def create

    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = @user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to @user
  end

def show
    @comment = Comment.find_by_id(params[:comment_id])
end


private

def comment_params
  params.require(:comment).permit(:body)
end

def get_post
  @post = Post.find_by_id(params[:post_id])
end

end
