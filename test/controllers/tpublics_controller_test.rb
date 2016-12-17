require 'test_helper'

class TpublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tpublics_new_url
    assert_response :success
  end

end
