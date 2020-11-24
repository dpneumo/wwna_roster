require 'test_helper'
require 'fixtures/files/mock_error_model'

class ShowErrsTest < ActiveSupport::TestCase
  setup do
    errs = Errs.new(["message 1", "message 2"])
    @err_mdl = MockErrorModel.new(errs)
    noerrs = Errs.new([])
    @noerr_mdl = MockErrorModel.new(noerrs)
  end

  test 'returns an empty string when model has no errors' do
    se = Shared::ShowErrs.new(@noerr_mdl)
    assert se.show.empty?
  end

  test 'returns error_markup when a model has errors' do
    se = Shared::ShowErrs.new(@err_mdl)
    assert se.show.include? "2 errors"
    assert se.show.include? "MockErrorModel"
    assert se.show.include? "<li>message 1</li>"
  end
end
