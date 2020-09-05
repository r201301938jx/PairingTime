require 'test_helper'

class Customer::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_likes_destroy_url
    assert_response :success
  end
end
