class Pair < ApplicationRecord
  belongs_to :customer

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :notifications, dependent: :destroy

  validates :customer_id, :title, :image, presence: true
  validates :title, length: { maximum: 20 }
  validates :caption, length: { maximum: 100 }

  attachment :image

  # タグ機能
  def save_tags(save_pair_tags)
    current_tags = tags.pluck(:name) unless tags.nil? #既存のタグ
    old_tags = current_tags - save_pair_tags #消すタグ
    new_tags = save_pair_tags - current_tags #新規追加タグ

    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      pair_tag = Tag.find_or_create_by(name: new_name)
      tags << pair_tag
    end
  end

  # お気に入り機能
  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  # 並び替え機能
  def self.sort(selection)
    case selection
    when 'new'
      all.order(created_at: :DESC)
    when 'old'
      all.order(created_at: :ASC)
    when 'likes'
      find(Like.group(:pair_id).order(Arel.sql('count(pair_id) desc')).pluck(:pair_id))
    when 'dislikes'
      find(Like.group(:pair_id).order(Arel.sql('count(pair_id) asc')).pluck(:pair_id))
    when 'many_comments'
      find(Comment.group(:pair_id).order(Arel.sql('count(pair_id) desc')).pluck(:pair_id))
    when 'few_comments'
      find(Comment.group(:pair_id).order(Arel.sql('count(pair_id) asc')).pluck(:pair_id))
    end
  end

  # お気に入り通知機能
  def create_notification_like!(current_customer)
    # 既にお気に入りに追加されているかチェック
    temp = Notification.where(["visiter_id = ? and visited_id = ? and pair_id = ? and action = ?", current_customer.id, customer_id, id, "like"])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        pair_id: id,
        visited_id: customer_id,
        action: "like"
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知機能
  def create_notification_comment!(current_customer, comment_id)
    # 他にコメントしているユーザーをチェックし、全員に通知送信
    temp_ids = Comment.select(:customer_id).where(pair_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_customer, comment_id, temp_id["customer_id"])
    end
    # 他にコメントしているユーザーがいなければ、投稿者のみに通知送信
    save_notification_comment!(current_customer, comment_id, customer_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_customer, comment_id, visited_id)
    notification = current_customer.active_notifications.new(
      pair_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: "comment"
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
