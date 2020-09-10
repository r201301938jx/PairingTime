class Customer::HomesController < ApplicationController

  def top
    @random_pairs = Pair.order("RAND()").limit(4)
    @like_ranks = Pair.find(Like.group(:pair_id).order('count(pair_id) desc').limit(3).pluck(:pair_id))
    @follower_ranks = Customer.find(Relationship.group(:followed_id).order('count(followed_id) desc').limit(4).pluck(:followed_id))
    @tag_ranks = Tag.find(Tagging.group(:tag_id).order('count(tag_id) desc').limit(10).pluck(:tag_id))
  end

  def about
  end

end
