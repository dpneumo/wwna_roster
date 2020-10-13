require 'test_helper'

class LotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lot = lots(:one)
  end

  test "should get index" do
    get lots_url
    assert_response :success
  end

  test "should get new" do
    get new_lot_url
    assert_response :success
  end

  test "should create lot" do
    assert_difference('Lot.count') do
      post lots_url, params: { lot: { image_link: @lot.image_link, latitude: @lot.latitude, longitude: @lot.longitude, note: @lot.note, number: @lot.number, street: @lot.street } }
    end

    assert_redirected_to lot_url(Lot.last)
  end

  test "should show lot" do
    get lot_url(@lot)
    assert_response :success
  end

  test "should get edit" do
    get edit_lot_url(@lot)
    assert_response :success
  end

  test "should update lot" do
    patch lot_url(@lot), params: { lot: { image_link: @lot.image_link, latitude: @lot.latitude, longitude: @lot.longitude, note: @lot.note, number: @lot.number, street: @lot.street } }
    assert_redirected_to lot_url(@lot)
  end

  test "should destroy lot" do
    assert_difference('Lot.count', -1) do
      delete lot_url(@lot)
    end

    assert_redirected_to lots_url
  end
end
