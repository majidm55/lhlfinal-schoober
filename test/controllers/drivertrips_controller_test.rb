require 'test_helper'

class DrivertripsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get drivertrips_create_url
    assert_response :success
  end

end
