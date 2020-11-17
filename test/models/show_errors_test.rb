require 'test_helper'
#require '../../app/view_objects/shared/show_errors'
require 'fixtures/files/mock_error_model'

class ShowErrorsTest < ActiveSupport::TestCase
  setup do
    @err_mdl = MockErrorModel.new(Errors.new(["message 1", "message 2"]))
    @noerr_mdl = MockErrorModel.new(Errors.new([]))
  end

  test 'returns an empty string when model has no errors' do
    se = Shared::ShowErrors.new(@noerr_mdl)
    assert se.call.empty?
  end

  test 'returns error_markup when a model has errors' do
    se = Shared::ShowErrors.new(@err_mdl)
    assert se.call.include? "2 errors"
    assert se.call.include? "MockErrorModel"
    assert se.call.include? "<li>message 1</li>"
  end
end
