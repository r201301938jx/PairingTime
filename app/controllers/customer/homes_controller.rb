class Customer::HomesController < ApplicationController

  def top
    @random_pairs = Pair.order("RANDOM()").limit(4)
  end

  def about
  end
end
