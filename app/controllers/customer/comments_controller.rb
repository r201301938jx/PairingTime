class Customer::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @pair = Pair.find(params[:pair_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.pair_id = @pair.id
    if @comment.save
      flash[:notice] = "投稿にコメントしました"
      @pair.create_notification_comment!(current_customer, @comment.id)
    else
      flash[:error] = "1~50文字のコメントを入力してください"
    end
  end

  def destroy
    @pair = Pair.find(params[:pair_id])
    comment = current_customer.comments.find_by(id: params[:id], pair_id: @pair.id)
    comment.destroy
    flash[:notice] = "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
