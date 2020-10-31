require 'test_helper'

class OccupantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occupant = occupants(:one)
  end

  test "should get index" do
    get occupants_url
    assert_response :success
  end

  test "should get new" do
    @house = houses(:one)
    get new_occupant_url(house_id: @house.id)
    assert_response :success
  end

  test "should create occupant" do
    assert_difference('Occupant.count') do
      post occupants_url, params: { occupant: { house_id: @occupant.house_id, note: @occupant.note, person_id: @occupant.person_id, relation: @occupant.relation, status: @occupant.status } }
    end

    assert_redirected_to occupant_url(Occupant.last)
  end

  test "should show occupant" do
    get occupant_url(@occupant)
    assert_response :success
  end

  test "should get edit" do
    get edit_occupant_url(@occupant)
    assert_response :success
  end

  test "should update occupant" do
    patch occupant_url(@occupant), params: { occupant: { house_id: @occupant.house_id, note: @occupant.note, person_id: @occupant.person_id, relation: @occupant.relation, status: @occupant.status } }
    assert_redirected_to occupant_url(@occupant)
  end

  test "should destroy occupant" do
    assert_difference('Occupant.count', -1) do
      delete occupant_url(@occupant)
    end

    assert_redirected_to occupants_url
  end
end
