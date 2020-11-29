class Email < ApplicationRecord
  belongs_to :person

  validates :addr, presence: true

  after_save :update_person_prefs
  after_save :make_preferred_uniq

  Locations = %w[ Home Work Other ]

  def self.locations
    Locations
  end

  def addressee
    person.fullname
  end

  def update_person_prefs
    person = Person.find(person_id)
    pref_id = preferred ? id : nil
    person.update(pref_email_id: pref_id)
  end

  def make_preferred_uniq
    Email.where.not(id: id ).update_all(preferred: false)
  end
end
