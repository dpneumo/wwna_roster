require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get phones_url
    assert_response :success
  end

  test "should get new" do
    get new_phone_url
    assert_response :success
  end

  test "should create phone" do
      @person = people(:one)
      assert_difference('Phone.count') do
      post phones_url, params: { phone: { person_id: @person.id, cc: @phone.cc,
                                          area: @phone.area, prefix: @phone.prefix, number: @phone.number,
                                          locn: @phone.locn, preferred: @phone.preferred,
                                          txt_capable: @phone.txt_capable } }
      end

    assert_redirected_to phone_url(Phone.last)
  end

  test "should show phone" do
    get phone_url(@phone)
    assert_response :success
  end

  test "should get edit" do
    get edit_phone_url(@phone)
    assert_response :success
  end

  test "should update phone" do
    patch phone_url(@phone), params: { phone: { cc: @phone.cc,
                                                area: @phone.area, prefix: @phone.prefix, number: @phone.number,
                                                locn: @phone.locn, preferred: @phone.preferred,
                                                txt_capable: @phone.txt_capable } }
    assert_redirected_to phone_url(@phone)
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete phone_url(@phone)
    end

    assert_redirected_to phones_url
  end
end
