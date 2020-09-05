class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :pair

  validates :text, presence: true

end
