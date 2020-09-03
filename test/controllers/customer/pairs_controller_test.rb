require 'test_helper'

class Customer::PairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_pairs_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_pairs_show_url
    assert_response :success
  end

  test "should get new" do
    get customer_pairs_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_pairs_edit_url
    assert_response :success
  end

end
