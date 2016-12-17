require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cats_show_url
    assert_response :success
  end

end
