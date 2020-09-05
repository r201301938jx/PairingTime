class Customer::LikesController < ApplicationController

  def create
    @pair = Pair.find(params[:pair_id])
    like = current_customer.likes.new(pair_id: @pair.id)
    like.save
    flash[:notice] = "お気に入りに追加しました"
    redirect_to request.referer
  end

  def destroy
    @pair = Pair.find(params[:pair_id])
    like = current_customer.likes.find_by(pair_id: @pair.id)
    like.destroy
    flash[:notice] = "お気に入りから削除しました"
    redirect_to request.referer
  end

  def index
    @like_pairs = current_customer.like_pairs
  end

end
