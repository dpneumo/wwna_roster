# frozen_string_literal: true

require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'get root_url for unauthenticated user should get sign in' do
    get root_url
    assert_redirected_to 'http://www.example.com/users/sign_in'
  end

  test 'get root_url for authenticated user should succeed' do
    log_in(users(:one))
    get root_url
    assert_response :success
  end

  test 'get people_url for unauthenticated user should get sign in' do
    get people_url
    assert_redirected_to 'http://www.example.com/users/sign_in'
  end

  test 'get people_url for authenticated user should succeed' do
    log_in(users(:one))
    get people_url
    assert_response :success
  end
end
