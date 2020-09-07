class Customer::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @pair = Pair.find(params[:pair_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.pair_id = @pair.id
    if @comment.save
      flash[:notice] = "投稿にコメントしました"
      @pair.create_notification_comment!(current_customer, @comment.id)
    end
    redirect_to request.referer
  end

  def destroy
    @pair = Pair.find(params[:pair_id])
    comment = current_customer.comments.find_by(id: params[:id], pair_id: @pair.id)
    comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
