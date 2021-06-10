require 'test_helper'

class InputTest < ActiveSupport::TestCase
  setup do
    @dp = DummyPresenter.new(nil,nil)
  end

  test "truth" do


    assert true
  end

  test "form= saves a form reference" do
    @dp.form = "my_form"
    assert_equal "my_form", @dp.form
  end
end

class DummyPresenter < ApplicationPresenter
end
