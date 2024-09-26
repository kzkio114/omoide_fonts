require "test_helper"

class FontsControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle_like" do
    get fonts_toggle_like_url
    assert_response :success
  end
end
