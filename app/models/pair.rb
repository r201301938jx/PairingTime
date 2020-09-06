class Pair < ApplicationRecord
  belongs_to :customer

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :customer_id, :title, :image, presence: true

  attachment :image

  def save_tags(save_pair_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - save_pair_tags
    new_tags = save_pair_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      pair_tag = Tag.find_or_create_by(name: new_name)
      self.tags << pair_tag
    end
  end

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Like.group(:pair_id).order(Arel.sql('count(pair_id) desc')).pluck(:pair_id))
    when 'dislikes'
      return find(Like.group(:pair_id).order(Arel.sql('count(pair_id) asc')).pluck(:pair_id))
    when 'many_comments'
      return find(Comment.group(:pair_id).order(Arel.sql('count(pair_id) desc')).pluck(:pair_id))
    when 'few_comments'
      return find(Comment.group(:pair_id).order(Arel.sql('count(pair_id) asc')).pluck(:pair_id))
    end
  end

end
