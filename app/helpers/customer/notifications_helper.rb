module Customer::NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_pair = link_to "あなたの投稿", pair_path(notification), style: "font-weight: bold;"
    @visiter_comment = notification.comment_id

    case notification.action
    when "follow"
      tag.a(notification.visiter.nickname, href: customer_path(@visiter), style: "font-weight: bold;") + "さんがあなたをフォローしました"
    when "like"
      tag.a(notification.visiter.nickname, href: customer_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a("あなたの投稿", href: pair_path(notification.pair_id), style: "font-weight: bold;") + "をお気に入りに追加しました"
    when "comment" then
      @comment = Comment.find_by(id: @visiter_comment)&.text
      if notification.pair.customer_id == notification.visited.id
        tag.a(@visiter.nickname, href: customer_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a("あなたの投稿", href: pair_path(notification.pair_id), style: "font-weight: bold;") + "にコメントしました"
      else
        tag.a(@visiter.nickname, href: customer_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a(notification.pair.customer.nickname, href: customer_path(notification.pair.customer_id), style: "font-weight: bold;") + "さんの" + tag.a("投稿", href: pair_path(notification.pair_id), style: "font-weight: bold;") + "にコメントしました"
      end
    end
  end

  # 未確認通知チェック
  def unchecked_notifications
    @notifications = current_customer.passive_notifications.where(checked: false)
  end
end
