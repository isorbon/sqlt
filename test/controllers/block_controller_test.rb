require 'test_helper'

class BlockControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get block_show_url
    assert_response :success
  end

end
