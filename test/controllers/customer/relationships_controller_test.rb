require 'test_helper'

class Customer::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_relationships_destroy_url
    assert_response :success
  end
end
