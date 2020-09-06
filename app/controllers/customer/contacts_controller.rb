class Customer::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      flash[:notice] = "お問い合わせを受け付けました。順番に対応いたしますので今しばらくお待ちください。"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
