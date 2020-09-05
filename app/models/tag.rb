class Tag < ApplicationRecord

  has_many :taggings, dependent: :destroy, foreign_key: 'tag_id'
  has_many :pairs, through: :taggings

end
