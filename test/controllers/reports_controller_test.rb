require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get homes" do
    get homes_url
    assert_response :success
  end

end
