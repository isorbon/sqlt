require 'test_helper'

class InspectionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get inspection_show_url
    assert_response :success
  end

  test "should get block" do
    get inspection_block_url
    assert_response :success
  end

end
