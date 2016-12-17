require 'test_helper'

class TusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tu = tus(:one)
  end

  test "should get index" do
    get tus_url
    assert_response :success
  end

  test "should get new" do
    get new_tu_url
    assert_response :success
  end

  test "should create tu" do
    assert_difference('Tu.count') do
      post tus_url, params: { tu: {  } }
    end

    assert_redirected_to tu_url(Tu.last)
  end

  test "should show tu" do
    get tu_url(@tu)
    assert_response :success
  end

  test "should get edit" do
    get edit_tu_url(@tu)
    assert_response :success
  end

  test "should update tu" do
    patch tu_url(@tu), params: { tu: {  } }
    assert_redirected_to tu_url(@tu)
  end

  test "should destroy tu" do
    assert_difference('Tu.count', -1) do
      delete tu_url(@tu)
    end

    assert_redirected_to tus_url
  end
end
