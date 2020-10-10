require 'test_helper'

class PersonEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_email = person_emails(:valid)
  end

  test "should get index" do
    get person_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_person_email_url
    assert_response :success
  end

  test "should create person_email" do
    assert_difference('PersonEmail.count') do
      post person_emails_url, params: { person_email: { locn: @person_email.locn, person_id: @person_email.person_id, email_id: @person_email.email_id, preferred: @person_email.preferred } }
    end

    assert_redirected_to person_email_url(PersonEmail.last)
  end

  test "should show person_email" do
    get person_email_url(@person_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_email_url(@person_email)
    assert_response :success
  end

  test "should update person_email" do
    patch person_email_url(@person_email), params: { person_email: { locn: @person_email.locn, person_id: @person_email.person_id, email_id: @person_email.email_id, preferred: @person_email.preferred } }
    assert_redirected_to person_email_url(@person_email)
  end

  test "should destroy person_email" do
    assert_difference('PersonEmail.count', -1) do
      delete person_email_url(@person_email)
    end

    assert_redirected_to person_emails_url
  end
end
