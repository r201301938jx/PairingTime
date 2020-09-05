class Pair < ApplicationRecord

  belongs_to :customer

  has_many :likes

  validates :customer_id, :title, :image, presence: true

  attachment :image

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
