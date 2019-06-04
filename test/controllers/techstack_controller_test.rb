require 'test_helper'

class TechstackControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get techstack_index_url
    assert_response :success
  end

end
