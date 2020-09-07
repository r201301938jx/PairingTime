class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pairs
  has_many :likes
  has_many :like_pairs, through: :likes, source: 'pair'
  has_many :comments

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower

  has_many :customer_rooms
  has_many :chats
  has_many :rooms, through: :customer_rooms

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id"
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id"

  validates :last_name, :first_name, :last_name_kana,
            :first_name_kana, :phone_number, :nickname,
            presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :last_name_kana, :first_name_kana,
            format: {
              with: /\A[\p{katakana}\p{blank}ー－]+\z/,
              message: "カタカナで入力して下さい。",
            }

  attachment :profile_image

  # 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    following_customer.include?(customer)
  end

  #通知機能
  def create_notification_follow!(current_customer)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ?", current_customer.id, id, "follow"])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        visited_id: id,
        action: "follow"
      )
      notification.save if notification.valid?
    end
  end

end
