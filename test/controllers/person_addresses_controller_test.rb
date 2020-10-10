require 'test_helper'

class PersonAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_address = person_addresses(:valid)
  end

  test "should get index" do
    get person_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_person_address_url
    assert_response :success
  end

  test "should create person_address" do
    assert_difference('PersonAddress.count') do
      post person_addresses_url, params: { person_address: { address_id: @person_address.address_id, locn: @person_address.locn, person_id: @person_address.person_id, preferred: @person_address.preferred } }
    end

    assert_redirected_to person_address_url(PersonAddress.last)
  end

  test "should show person_address" do
    get person_address_url(@person_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_address_url(@person_address)
    assert_response :success
  end

  test "should update person_address" do
    patch person_address_url(@person_address), params: { person_address: { address_id: @person_address.address_id, locn: @person_address.locn, person_id: @person_address.person_id, preferred: @person_address.preferred } }
    assert_redirected_to person_address_url(@person_address)
  end

  test "should destroy person_address" do
    assert_difference('PersonAddress.count', -1) do
      delete person_address_url(@person_address)
    end

    assert_redirected_to person_addresses_url
  end
end
