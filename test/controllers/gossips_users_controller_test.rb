require "test_helper"

class GossipsUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gossips_users_show_url
    assert_response :success
  end
end
