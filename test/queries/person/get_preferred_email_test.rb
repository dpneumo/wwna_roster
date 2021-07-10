# frozen_string_literal: true

require 'test_helper'

class Persons::GetPreferredEmailTest < ActiveSupport::TestCase
  test 'returns preferred email for a person' do
    per = people(:one)
    em = Persons::GetPreferredEmail.call(per.id)
    assert_equal 'aaa@bbb.ccc', em.addr
  end
end

