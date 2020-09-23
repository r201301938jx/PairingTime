class Customer::CommentsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @pair = Pair.find(params[:pair_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.pair_id = @pair.id
    if @comment.save
      @pair.create_notification_comment!(current_customer, @comment.id)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @pair = Pair.find(params[:pair_id])
    comment = current_customer.comments.find_by(id: params[:id], pair_id: @pair.id)
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end