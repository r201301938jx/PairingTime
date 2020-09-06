require 'rails_helper'

RSpec.describe "Customer::Searches", type: :request do

  describe "GET /search" do
    it "returns http success" do
      get "/customer/search/search"
      expect(response).to have_http_status(:success)
    end
  end

end
