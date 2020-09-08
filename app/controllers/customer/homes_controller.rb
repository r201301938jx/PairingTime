class Customer::HomesController < ApplicationController

  def top
    @random_pairs = Pair.order("RANDOM()").limit(4)
    @like_ranks = Pair.find(Like.group(:pair_id).order('count(pair_id) desc').limit(4).pluck(:pair_id))
    @comment_ranks = Pair.find(Comment.group(:pair_id).order('count(pair_id) desc').limit(4).pluck(:pair_id))
    @follower_ranks = Customer.find(Relationship.group(:followed_id).order('count(followed_id) desc').limit(4).pluck(:followed_id))
  end

  def about
  end
end
