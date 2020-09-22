class Customer::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :quit, :withdraw]
  before_action :ensure_active_customer, only: [:show]

  def show
    @customer = Customer.find(params[:id])
    @pairs = @customer.pairs.order(created_at: :DESC)
    @pairs = @pairs.page(params[:page]).per(12)
    @likes = Like.where(pair_id: @customer.pairs.ids)
    @comments = Comment.where(pair_id: @customer.pairs.ids)
    # 今日のデータ取得
    @today_pairs = @customer.pairs.where(created_at: Time.zone.now.all_day)
    @today_likes = @likes.where(created_at: Time.zone.now.all_day)
    @today_comments = @comments.where(created_at: Time.zone.now.all_day)
    @today_comments = @comments.where(created_at: Time.zone.now.all_day)
    @today_followers = @customer.followed.where(created_at: Time.zone.now.all_day)
    # グラフ用に日別のデータ取得
    @pair_data = @customer.pairs.group("date(created_at)").count
    @like_data = @likes.group("date(created_at)").count
    @comment_data = @comments.group("date(created_at)").count
    @follower_data = @customer.followed.group("date(created_at)").count
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def quit
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    @customer.pairs.destroy_all
    @customer.likes.destroy_all
    @customer.follower.destroy_all
    @customer.followed.destroy_all
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def follows
  end

  def followers
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname, :profile_image)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

  def ensure_active_customer
    @customer = Customer.find(params[:id])
    unless @customer.is_deleted == false
      flash[:error] = "有効な会員ではありません"
      redirect_to customer_path(current_customer)
    end
  end

end