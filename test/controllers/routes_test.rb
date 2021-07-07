# frozen_string_literal: true

require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'get *_url for unauthenticated user should get sign in' do
    get root_url
    assert_redirected_to 'http://www.example.com/users/sign_in'
    get people_url
    assert_redirected_to 'http://www.example.com/users/sign_in'
  end

  test 'get *_url for authenticated user should suceed' do
    log_in users(:one)
    get root_url
    assert_response :success
    get people_url
    assert_response :success
  end

  test 'root' do
    assert_generates '/',
                     controller: 'welcome',
                     action: 'home'
  end

  test 'users' do
    assert_generates '/users',
                     controller: 'users/admin',
                     action: 'index'
  end

  test 'show_user' do
    assert_generates '/users/1',
                     controller: 'users/admin',
                     action: 'show',
                     id: '1'
  end

  test 'edit_user' do
    assert_generates '/users/1/edit',
                     controller: 'users/admin',
                     action: 'edit',
                     id: '1'
  end

  test 'people' do
    assert_generates '/people',
                     controller: 'people',
                     action: 'index'
  end

  test 'people_detail' do
    assert_generates '/people/4/detail',
                     controller: 'people',
                     action: 'detail',
                     id: '4'
  end

  test 'people_occupant' do
    assert_generates '/people/occupant/3',
                     controller: 'people',
                     action: 'new_occupant',
                     house_id: '3'
  end

  test 'house_detail' do
    assert_generates '/houses/5/detail',
                     controller: 'houses',
                     action: 'detail',
                     id: '5'
  end

  test 'non_occupants' do
    assert_generates '/non_occupants',
                     controller: 'non_occupants',
                     action: 'index'
  end
end
