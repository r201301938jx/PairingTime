class Customer < ApplicationRecord
  has_many :sns_credentials

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(facebook twitter google_oauth2)

  has_many :pairs
  has_many :likes
  has_many :like_pairs, through: :likes, source: 'pair'
  has_many :comments

  # フォロー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower

  # チャット機能
  has_many :customer_rooms
  has_many :chats
  has_many :rooms, through: :customer_rooms

  # 通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id"
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id"

  validates :last_name, :first_name, :last_name_kana,
            :first_name_kana, :phone_number, :email, :nickname,
            presence: true
  validates :email, :nickname, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, length: { maximum: 10 }
  validates :nickname, length: { maximum: 20 }
  validates :last_name_kana, :first_name_kana,
            format: {
              with: /\A[\p{katakana}\p{blank}ー－]+\z/,
              message: "はカタカナで入力してください。",
            }

  attachment :profile_image

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: "guest@test.com") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ゲスト"
      customer.first_name = "ユーザー"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ユーザー"
      customer.nickname = "ゲストユーザー"
      customer.phone_number = "09000001111"
    end
  end

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

  # 並び替え機能
  def self.sort(selection)
    case selection
    when 'new'
      all.order(created_at: :DESC)
    when 'old'
      all.order(created_at: :ASC)
    when 'active'
      where(is_deleted: false)
    when 'inactive'
      where(is_deleted: true)
    when 'nickname'
      all.order(:nickname)
    end
  end

  # 通知機能
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

  # SNS認証機能
  def self.without_sns_data(auth)
    customer = Customer.where(email: auth.info.email).first

    if customer.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        customer_id: customer.id
      )
    else
      customer = Customer.new(
        nickname: auth.info.name,
        email: auth.info.email
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    { customer: customer, sns: sns }
  end

  def self.with_sns_data(auth, snscredential)
    customer = Customer.where(id: snscredential.customer_id).first
    if customer.blank?
      customer = Customer.new(
        nickname: auth.info.name,
        email: auth.info.email
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    { customer: customer }
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      customer = with_sns_data(auth, snscredential)[:customer]
      sns = snscredential
    else
      customer = without_sns_data(auth)[:customer]
      sns = without_sns_data(auth)[:sns]
    end
    { customer: customer, sns: sns }
  end
end
