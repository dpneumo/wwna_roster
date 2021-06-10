require 'test_helper'

class ContributionPresenterTest < ActiveSupport::TestCase
  test "Contribution class returns contributions for a house in a given year" do
    contrib1 = StubContribution.new('1', 19999)
    cp = ContributionPresenter.new(nil, nil)
    Contributions::GetForHouseAndYear.stub(:call, [contrib1]) do
      assert_equal 19999, cp.for(house_id: 1, year: 2020)
    end
  end

  test "Contribution class returns total contributions for a given year" do
    contrib1 = StubContribution.new('1', 19999)
    contrib2 = StubContribution.new('2', 29999)
    cp = ContributionPresenter.new(nil, nil)
    Contributions::GetForYear.stub(:call, [contrib1, contrib2]) do
      assert_equal 49998, cp.total_for(year: 2020)
    end
  end

  test "returns a list of all houses" do
    cp = ContributionPresenter.new(nil, nil)
    assert_equal "123A Oak Dr", cp.house_list.first.first
  end

  test "returns house address if house defined" do
    hs = StubHouse.new(1, '123', 'Oak')
    contrib = StubContribution.new(1, 2345, hs)
    cp = ContributionPresenter.new(contrib, nil)
    assert_equal '123 Oak', cp.house_address
  end

  test "returns '' if house nil" do
    contrib = StubContribution.new(1, 2345, nil)
    cp = ContributionPresenter.new(contrib, nil)
    assert_equal '', cp.house_address
  end

  test "returns a year range" do
    cp = ContributionPresenter.new(nil, nil)
    assert_equal '1995-01-01'..'1995-12-31', cp.year_range(1995)
  end
end
