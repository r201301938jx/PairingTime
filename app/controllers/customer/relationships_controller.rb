class Customer::RelationshipsController < ApplicationController
  before_action :authenticate_customer!

  def create
    current_customer.follow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
    @customer.create_notification_follow!(current_customer)
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  def follower
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.following_customer.page(params[:page]).per(10)
  end

  def followed
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.follower_customer.page(params[:page]).per(10)
  end
end
