class Address < ApplicationRecord
  belongs_to :person

  validates :number, presence: true
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :zip,    presence: true

  after_save :update_person_prefs
  after_save :make_preferred_uniq, if: -> { preferred }

  def self.types
    Enums.address_types
  end

  def address
    "#{number} #{street}, #{city}, #{state}  #{zip}"
  end

  def addressee
    person.fullname
  end

  def update_person_prefs
    persn = Person.find(person_id)
    pref_id = preferred ? id : nil
    persn.update(pref_address_id: pref_id)
  end

  def make_preferred_uniq
    Address.where.not(id: id ).update_all(preferred: false)
  end
end
