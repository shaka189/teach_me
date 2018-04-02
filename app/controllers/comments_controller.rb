class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.build comment_params
    if comment.save
      ActionCable.server.broadcast "request_channel",
                                   content: comment.content,
                                   created_at: comment.created_at,
                                   username: comment.user.name
    else
      flash[:danger] = t "controllers.request.create_comment_false"
      redirect_to root_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :user_id, :request_id
  end
end
