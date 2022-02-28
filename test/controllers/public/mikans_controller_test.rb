require "test_helper"

class Public::MikansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_mikans_index_url
    assert_response :success
  end

  test "should get show" do
    get public_mikans_show_url
    assert_response :success
  end
end
