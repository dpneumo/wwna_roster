class Email < ApplicationRecord
  belongs_to :person

  validates :addr, presence: true

  def addressee
    person.fullname
  end
end
