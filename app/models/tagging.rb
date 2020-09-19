class Tagging < ApplicationRecord
  belongs_to :pair
  belongs_to :tag

  validates :pair_id, presence: true
  validates :tag_id, presence: true
end
