class Chat < ApplicationRecord

  belongs_to :customer
  belongs_to :room

  validates :message, presence: true
  validates :message, length: {maximum: 20}

end
