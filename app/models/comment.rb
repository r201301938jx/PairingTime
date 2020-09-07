class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :pair

  has_many :notifications, dependent: :destroy

  validates :text, presence: true

end
