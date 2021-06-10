require 'test_helper'

class Person::GetPreferredPhoneTest < ActiveSupport::TestCase
  test "returns preferred phone for a person" do
    per = people(:one)
    ph = Person::GetPreferredPhone.call(per.id)
    assert_equal '(817) 123-4567', PhonePresenter.new(ph,nil).ph_number
  end
end
