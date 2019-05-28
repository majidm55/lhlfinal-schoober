require 'test_helper'

class MatchtripsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get matchtrips_create_url
    assert_response :success
  end

end
