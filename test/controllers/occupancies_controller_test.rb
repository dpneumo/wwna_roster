require 'test_helper'

class OccupanciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occupancy = occupancies(:one)
  end

  test "should get index" do
    get occupancies_url
    assert_response :success
  end

  test "should get new" do
    get new_occupancy_url
    assert_response :success
  end

  test "should create occupancy" do
    assert_difference('Occupancy.count') do
      post occupancies_url, params: { occupancy: { house_id: @occupancy.house_id, note: @occupancy.note, person_id: @occupancy.person_id, relation: @occupancy.relation, status: @occupancy.status } }
    end

    assert_redirected_to occupancy_url(Occupancy.last)
  end

  test "should show occupancy" do
    get occupancy_url(@occupancy)
    assert_response :success
  end

  test "should get edit" do
    get edit_occupancy_url(@occupancy)
    assert_response :success
  end

  test "should update occupancy" do
    patch occupancy_url(@occupancy), params: { occupancy: { house_id: @occupancy.house_id, note: @occupancy.note, person_id: @occupancy.person_id, relation: @occupancy.relation, status: @occupancy.status } }
    assert_redirected_to occupancy_url(@occupancy)
  end

  test "should destroy occupancy" do
    assert_difference('Occupancy.count', -1) do
      delete occupancy_url(@occupancy)
    end

    assert_redirected_to occupancies_url
  end
end
