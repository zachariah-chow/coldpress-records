require 'test_helper'

class CartDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_details_create_url
    assert_response :success
  end

end
