class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pairs

  validates :last_name, :first_name, :last_name_kana,
            :first_name_kana, :phone_number, :nickname,
            presence: true
  validates :phone_number, numericality: {only_integer: true}
  validates :last_name_kana, :first_name_kana,
            format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/,
                     message: "カタカナで入力して下さい。"}

  attachment :profile_image

  #退会機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
