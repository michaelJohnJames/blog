class CommentsController < ApplicationController
  before_action :get_post, :authenticate, :current_user



  def create
    @comment = @user.comments.create(comment_params)
    #@comment.user_id = current_user_id
    @comment.save
  end

def show
  @comment = @user.comments.create(comment_params)
end






private

def comment_params
  params.require(:comment).permit(:body)
end

def get_post
  @post = Post.find_by_id(params[:post_id])
end

end
