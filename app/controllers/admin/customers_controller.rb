class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  def search
    @content = params[:search][:content]
    @all_records = search_for(@content)
    @records = @all_records.page(params[:page]).per(10)
  end

  def sort
    selection = params[:keyward]
    @all_customers = Customer.sort(selection)
    @customers = Kaminari.paginate_array(@all_customers).page(params[:page]).per(10)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname, :profile_image, :is_deleted)
  end

  def search_for(content)
    Customer.where(['last_name LIKE ? OR first_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ? OR nickname LIKE ? OR email LIKE ?', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%', '%' + content + '%'])
  end
end
