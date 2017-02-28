require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get info_path
    assert_response :success
  end

  test "should get new" do
    get details_path
    assert_response :success
  end

end
