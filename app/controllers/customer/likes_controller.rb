class Customer::LikesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @pair = Pair.find(params[:pair_id])
    like = current_customer.likes.new(pair_id: @pair.id)
    like.save
    @pair.create_notification_like!(current_customer)
  end

  def destroy
    @pair = Pair.find(params[:pair_id])
    like = current_customer.likes.find_by(pair_id: @pair.id)
    like.destroy
  end

  def index
    @like_pairs = current_customer.like_pairs.order(created_at: :DESC).page(params[:page]).per(12)
  end
end
