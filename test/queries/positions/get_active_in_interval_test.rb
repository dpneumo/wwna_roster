require 'test_helper'

class GetActiveInIntervalTest< ActiveSupport::TestCase
  test "rtns positions active some time during an interval" do
    istart = Date.current.next_year.beginning_of_quarter
    istop = Date.current.next_year.end_of_quarter
    posns = Positions::GetActiveInInterval.call(istart, istop)
    assert_equal 1, posns.count
  end
end
