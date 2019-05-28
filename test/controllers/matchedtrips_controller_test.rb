require 'test_helper'

class MatchedtripsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get matchedtrips_create_url
    assert_response :success
  end

end
