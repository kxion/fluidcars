class CommentsController < ApplicationController
  before_filter :signed_in_user
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_name = current_user.name
    @comment.user_avatar = current_user.profile.avatar
    if @comment.save
      flash[:success] = '评论成功！'
      redirect_to my_order_url
    else
      flash[:error] = '抱歉，评论提交失败'
      render action: "new" 
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :score)
  end
end
