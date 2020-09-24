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

  #投稿の説明のリンクをaタグに変更
  require "uri"
  def text_url_to_link(text)
    URI.extract(text, ['http','https'] ).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      text.gsub!(url, sub_text)
    end
    return text
  end

end