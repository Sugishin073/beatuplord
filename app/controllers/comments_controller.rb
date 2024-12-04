class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to beat_path(comment.beat.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, beat_id: params[:beat_id])
  end
end
