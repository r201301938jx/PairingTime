module Customer::NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_pair = link_to "あなたの投稿", pair_path(notification), style: "font-weight: bold;"
    @visiter_comment = notification.comment_id

    case notification.action
    when  "follow" then
      tag.a(notification.visiter.nickname, href:customer_path(@visiter), style: "font-weight: bold;")+"さんがあなたをフォローしました"
    when "like" then
      tag.a(notification.visiter.nickname, href:customer_path(@visiter), style: "font-weight: bold;")+"さんが"+tag.a("あなたの投稿", href:pair_path(notification.pair_id), style:"font-weight: bold;")+"にいいねしました"
    when "comment" then
      @comment = Comment.find_by(id: @visiter_comment)&.text
      tag.a(@visiter.nickname, href:customer_path(@visiter), style: "font-weight: bold;")+"さんが"+tag.a("あなたの投稿", href:pair_path(notification.pair_id), style: "font-weight: bold;")+"にコメントしました"
    end
  end

end
