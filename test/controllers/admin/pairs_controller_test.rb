require 'test_helper'

class Admin::PairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pairs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_pairs_show_url
    assert_response :success
  end
end
