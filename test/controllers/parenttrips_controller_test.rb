require 'test_helper'

class ParenttripsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get parenttrips_create_url
    assert_response :success
  end

  test "should get show" do
    get parenttrips_show_url
    assert_response :success
  end

end
