require 'test_helper'

class PersonPhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_phone = person_phones(:valid)
  end

  test "should get index" do
    get person_phones_url
    assert_response :success
  end

  test "should get new" do
    get new_person_phone_url
    assert_response :success
  end

  test "should create person_phone" do
    assert_difference('PersonPhone.count') do
      post person_phones_url, params: { person_phone: { locn: @person_phone.locn, person_id: @person_phone.person_id, phone_id: @person_phone.phone_id, preferred: @person_phone.preferred } }
    end

    assert_redirected_to person_phone_url(PersonPhone.last)
  end

  test "should show person_phone" do
    get person_phone_url(@person_phone)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_phone_url(@person_phone)
    assert_response :success
  end

  test "should update person_phone" do
    patch person_phone_url(@person_phone), params: { person_phone: { locn: @person_phone.locn, person_id: @person_phone.person_id, phone_id: @person_phone.phone_id, preferred: @person_phone.preferred } }
    assert_redirected_to person_phone_url(@person_phone)
  end

  test "should destroy person_phone" do
    assert_difference('PersonPhone.count', -1) do
      delete person_phone_url(@person_phone)
    end

    assert_redirected_to person_phones_url
  end
end
