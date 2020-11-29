class Phone < ApplicationRecord
  belongs_to :person

  validates :area, presence: true
  validates :prefix, presence: true
  validates :number, presence: true

  after_save :update_person_prefs
  after_save :make_preferred_uniq

  Locations = %w[ Home Work Other ]

  def self.locations
    Locations
  end

  def ph_number
    "(#{area}) #{prefix}-#{number}"
  end

  def person_name
    person.fullname
  end

  def update_person_prefs
    person = Person.find(person_id)
    pref_id = preferred ? id : nil
    person.update(pref_phone_id: pref_id)
  end

  def make_preferred_uniq
    Phone.where.not(id: id ).update_all(preferred: false)
  end
end
