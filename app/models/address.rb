class Address < ApplicationRecord
  belongs_to :person

  validates :number, presence: true
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :zip,    presence: true

  def address
    "#{number} #{street}, #{city}, #{state}  #{zip}"
  end

  def addressee
    person.fullname
  end
end
