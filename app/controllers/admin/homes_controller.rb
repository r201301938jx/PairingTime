class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    # 今日のデータ取得
    @today_customers = Customer.where(created_at: Time.zone.now.all_day)
    @today_pairs = Pair.where(created_at: Time.zone.now.all_day)
    @today_likes = Like.where(created_at: Time.zone.now.all_day)
    @today_comments = Comment.where(created_at: Time.zone.now.all_day)
    # グラフ用に日別のデータ取得
    @customer_data = Customer.group("date(created_at)").count
    @pair_data = Pair.group("date(created_at)").count
    @like_data = Like.group("date(created_at)").count
    @comment_data = Comment.group("date(created_at)").count
    @tag_data = Tagging.eager_load(:tag).group(:'tags.name').count
  end
end
