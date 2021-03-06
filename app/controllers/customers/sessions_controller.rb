# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # ゲストログイン機能
  def new_guest
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
        flash[:error] = "退会済みです。同一アカウントの再利用をご希望される場合には、お問い合わせ機能をご活用ください"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "必須項目を入力してください"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
