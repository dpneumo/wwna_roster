require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "get root_url for unauthenticated user should get sign in" do
  	get root_url
  	assert_redirected_to controller:'devise/sessions', action: 'new'
  end

  test "get root_url for authenticated user should succeed" do
  	log_in(users(:one))
    get root_url
    assert_response :success
  end

  test "get phones_url for unauthenticated user should get sign in" do
  	get phones_url
  	assert_redirected_to controller:'devise/sessions', action: 'new'
  end

  test "get phones_url for authenticated user should succeed" do
  	log_in(users(:one))
    get phones_url
    assert_response :success
  end
end
