class Pair < ApplicationRecord

  belongs_to :customer

  # validates :customer_id, :title, :image_id, presence: true

  attachment :image

end
