class MockErrorModel
  attr_reader :errors

  delegate :any?, to: :errors

  def initialize(errors)
    @errors = errors
  end

  def model_name
    self.class.name.demodulize
  end

  def err_msgs
    @errors.full_messages
  end
end

class Errors
  def initialize(messages)
    @messages = messages || []
  end

  def any?
    @messages.any?
  end

  def count
    @messages.count
  end

  def full_messages
    @messages
  end
end
