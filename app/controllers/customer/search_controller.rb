class Customer::SearchController < ApplicationController

  before_action :authenticate_customer!

  def search
    @content = params["search"]["content"]
    @records = search_for(@content)
  end

  private

  def search_for(content)
    Pair.where('title LIKE ?', '%'+content+'%')
  end

end
