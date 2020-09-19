class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :pair

  has_many :notifications, dependent: :destroy

  validates :text, presence: true
  validates :text, length: { maximum: 50 }
end
