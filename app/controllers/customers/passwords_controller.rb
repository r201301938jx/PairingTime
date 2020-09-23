# frozen_string_literal: true

class Customers::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer.present?
      @customer.send_reset_password_instructions
      flash[:notice] = "パスワード再発行メールを送信しました"
      redirect_to root_path
    else
      flash[:error] = "メールアドレスに紐付くアカウントが発見されませんでした"
      redirect_to new_customer_password_path
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    super
  end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
