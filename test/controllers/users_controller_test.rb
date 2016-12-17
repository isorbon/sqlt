require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get iam" do
    get users_iam_url
    assert_response :success
  end

end
