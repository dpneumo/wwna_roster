# frozen_string_literal: true

require 'test_helper'

class Person
  class GetPreferredAddressTest < ActiveSupport::TestCase
    test 'returns preferred address for a person' do
      per = people(:one)
      addr = Person::GetPreferredAddress.call(per.id)
      assert_equal '123A Oak Dr, Arlington, TX 76016', addr.address
    end
  end
end