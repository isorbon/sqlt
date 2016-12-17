require 'test_helper'

class StudetTControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get studet_t_new_url
    assert_response :success
  end

end
