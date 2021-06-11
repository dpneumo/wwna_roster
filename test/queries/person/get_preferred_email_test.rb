# frozen_string_literal: true

require 'test_helper'

class Person
  class GetPreferredEmailTest < ActiveSupport::TestCase
    test 'returns preferred email for a person' do
      per = people(:one)
      em = Person::GetPreferredEmail.call(per.id)
      assert_equal 'aaa@bbb.ccc', em.addr
    end
  end
end