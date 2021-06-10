# frozen_string_literal: true

require 'test_helper'

class EmailPresenterTest < ActiveSupport::TestCase
  test 'types returns an array' do
    email = StubEmail.new
    types = EmailPresenter.new(email, nil).types
    assert_equal Array, types.class
  end

  test "addressee returns 'Unknown' if email does not have a person" do
    email = StubEmail.new
    presenter = EmailPresenter.new(email, nil)
    assert_equal 'Unknown', presenter.addressee
  end

  test 'addressee returns the name of the person assigned to an email' do
    sally = StubPerson1.new('1', 'Sally Ride')
    email = StubEmail.new('123', 'a@b.c', sally)
    presenter = EmailPresenter.new(email, nil)
    assert_equal 'Sally Ride', presenter.addressee
  end
end
