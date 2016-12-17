require 'test_helper'

class UsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get uses_new_url
    assert_response :success
  end

  test "should get db_con" do
    get uses_db_con_url
    assert_response :success
  end

end
