require 'test_helper'

class AutoMatchingControllerTest < ActionDispatch::IntegrationTest
  test "should get match" do
    get auto_matching_match_url
    assert_response :success
  end

end
