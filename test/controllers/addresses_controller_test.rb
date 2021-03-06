# frozen_string_literal: true

require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
    login_as(users(:one))
  end

  test 'should get index' do
    get addresses_url
    assert_response :success
  end

  test 'should get new' do
    @person = people(:one)
    get new_address_url(person_id: @person.id)
    assert_response :success
  end

  test 'should create address' do
    @person = people(:one)
    assert_difference('Address.count') do
      post addresses_url,
           params: { address: { person_id: @person.id, number: @address.number, street: @address.street, city: @address.city,
                                state: @address.state, zip: @address.zip } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test 'should show address' do
    get address_url(@address)
    assert_response :success
  end

  test 'should get edit' do
    get edit_address_url(@address)
    assert_response :success
  end

  test 'should update address' do
    patch address_url(@address),
          params: { address: { number: @address.number, street: @address.street, city: @address.city, state: @address.state,
                               zip: @address.zip } }
    assert_redirected_to address_url(@address)
  end

  test 'should destroy address' do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end
end
