require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get add_favorite" do
    get likes_add_favorite_url
    assert_response :success
  end

  test "should get destroy_favorite" do
    get likes_destroy_favorite_url
    assert_response :success
  end

end
