module ApplicationHelper

  def full_title(title = "")
    base_title = "PairingTime"
    if admin_signed_in?
      base_title + " | " + "[管理者] #{title}"
    else
      base_title + " | " + "#{title}"
    end
  end

  def full_name(customer)
    "#{customer.last_name} #{customer.first_name}"
  end

  def full_name_kana(customer)
    "#{customer.last_name_kana} #{customer.first_name_kana}"
  end

end
