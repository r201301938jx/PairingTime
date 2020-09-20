class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @today_customers = Customer.where(created_at: Time.zone.now.all_day)
    @today_pairs = Pair.where(created_at: Time.zone.now.all_day)
    @today_likes = Like.where(created_at: Time.zone.now.all_day)
    @today_comments = Comment.where(created_at: Time.zone.now.all_day)
    @customer_data = Customer.group("date(created_at, '+9 hours')").count
    @pair_data = Pair.group("date(created_at, '+9 hours')").count
    @like_data = Like.group("date(created_at, '+9 hours')").count
    @comment_data = Comment.group("date(created_at, '+9 hours')").count
    @tag_data = Tagging.eager_load(:tag).group(:'tags.name').count
  end

end
