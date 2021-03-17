class Email < ApplicationRecord
  belongs_to :person

  validates :addr, presence: true

  after_save :update_person_prefs
  after_save :make_preferred_uniq, if: -> { preferred }

  def self.types
    Enums.email_types
  end

  def addressee
    person.fullname
  end

  def update_person_prefs
    persn = Person.find(person_id)
    pref_id = preferred ? id : nil
    persn.update(pref_email_id: pref_id)
  end

  def make_preferred_uniq
    Email.where.not(id: id ).update_all(preferred: false)
  end
end
