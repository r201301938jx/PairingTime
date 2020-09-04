class Admin::HomesController < ApplicationController

  def top
    @today_customers = Customer.where(created_at: Time.zone.now.all_day)
    @today_pairs = Pair.where(created_at: Time.zone.now.all_day)
  end

end
