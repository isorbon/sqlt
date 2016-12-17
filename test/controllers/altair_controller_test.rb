require 'test_helper'

class AltairControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get altair_home_url
    assert_response :success
  end

  test "should get help" do
    get altair_help_url
    assert_response :success
  end

  test "should get about" do
    get altair_about_url
    assert_response :success
  end

  test "should get contact" do
    get altair_contact_url
    assert_response :success
  end

  test "should get theory" do
    get altair_theory_url
    assert_response :success
  end

end
