require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
    login_as(users(:one))
  end

  test "should get index" do
    get houses_url
    assert_response :success
  end

  test "should get new" do
    get new_house_url
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post houses_url, params: { house: { image_link: @house.image_link, lat: @house.lat, lng: @house.lng, number: @house.number, street: @house.street,
                                          flag: @house.flag, linked_lot_id: @house.linked_lot_id, listed: @house.listed, note: @house.note, rental: @house.rental, status: @house.status } }
    end

    assert_redirected_to house_url(House.last)
  end

  test "should show house" do
    get house_url(@house)
    assert_response :success
  end

  test "should return house detail" do
    get house_detail_url(@house)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_url(@house)
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { image_link: @house.image_link, lat: @house.lat, lng: @house.lng, number: @house.number, street: @house.street,
                                       flag: @house.flag, linked_lot_id: @house.linked_lot_id, listed: @house.listed, note: @house.note, rental: @house.rental, status: @house.status } }
    assert_redirected_to house_url(@house)
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete house_url(@house)
    end

    assert_redirected_to houses_url
  end
end
