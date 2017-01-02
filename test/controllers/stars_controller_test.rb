require 'test_helper'

class StarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stars_index_url
    assert_response :success
  end

  test "should get new" do
    get stars_new_url
    assert_response :success
  end

  test "should get create" do
    get stars_create_url
    assert_response :success
  end

end
