require 'test_helper'

class LoctimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get loctimes_new_url
    assert_response :success
  end

  test "should get index" do
    get loctimes_index_url
    assert_response :success
  end

  test "should get edit" do
    get loctimes_edit_url
    assert_response :success
  end

  test "should get show" do
    get loctimes_show_url
    assert_response :success
  end

end
