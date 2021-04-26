require 'test_helper'

class Positions::GetCurrentForPersonTest < ActiveSupport::TestCase
  test "current_posns_for_person rtns positions currently held by person" do
    per = people(:one)
    posns = Positions::GetCurrentForPerson.call(per.id)
    assert_equal 2, posns.count
    posn_names = posns.map {|p| p.name }
    assert posn_names.include? 'President'
  end
end
