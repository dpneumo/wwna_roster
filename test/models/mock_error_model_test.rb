require 'test_helper'
require 'fixtures/files/mock_error_model'

class MockErrorModelTest < ActiveSupport::TestCase
  setup do
    @mdl = MockErrorModel.new(Errors.new(["message 1", "message 2"]))
  end

  test 'responds to #model_name' do
    assert @mdl.respond_to? :model_name
  end

  test 'responds to #err_msgs' do
    assert @mdl.respond_to? :err_msgs
  end

  test 'responds to #errors' do
    assert @mdl.respond_to? :errors
  end

  test 'responds to #errors.any?' do
    assert @mdl.errors.respond_to? :any?
  end

  test 'responds to #errors.count' do
    assert @mdl.errors.respond_to? :count
  end

  test 'responds to #errors.full_messages' do
    assert @mdl.errors.respond_to? :full_messages
  end
end
