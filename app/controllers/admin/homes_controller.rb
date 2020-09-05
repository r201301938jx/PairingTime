class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @today_customers = Customer.where(created_at: Time.zone.now.all_day)
    @today_pairs = Pair.where(created_at: Time.zone.now.all_day)
    @today_likes = Like.where(created_at: Time.zone.now.all_day)
  end

end
