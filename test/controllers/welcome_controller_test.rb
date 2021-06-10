# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'get root_url for authenticated user should succeed' do
    log_in(users(:one))
    get root_url
    assert_response :success
  end

  test 'get root_url for unauthenticated user should redirect to sign in' do
    get root_url
    assert_redirected_to 'http://www.example.com/users/sign_in'
  end
end
