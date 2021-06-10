# frozen_string_literal: true

require 'test_helper'

module Positions
  class GetCurrentForPersonTest < ActiveSupport::TestCase
    test 'current_posns_for_person rtns positions currently held by person' do
      per = people(:one)
      posns = Positions::GetCurrentForPerson.call(per.id)
      assert_equal 2, posns.count
      posn_names = posns.map(&:name)
      assert posn_names.include? 'President'
    end
  end
end
