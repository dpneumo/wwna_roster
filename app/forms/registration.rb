
class Registration
  include ActiveModel::Model

  attr_accessor :nickname, :first, :middle, :last, :role, :status, :house_id

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      person = Person.create!(nickname: nickname, first: first, middle: middle, last: last,
                              house_id: house_id, status: status, relation: relation)
    end

    true
  rescue ActiveRecord::StatementInvalid => e
    # Handle exception that caused the transaction to fail
    # e.message and e.cause.message can be helpful
    errors.add(:base, e.message)

    false
  end

end
