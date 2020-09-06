require 'rails_helper'

RSpec.describe "Customer::Chats", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/customer/chats/show"
      expect(response).to have_http_status(:success)
    end
  end

end
