class CommentsController < ApplicationController
  before_filter :signed_in_user
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_name = current_user.name
    @comment.user_avatar = current_user.avatar
    if @comment.save
      redirect_to my_order_url, notice: '评论成功！'
    else
      render action: "new" 
    end
  end

end
