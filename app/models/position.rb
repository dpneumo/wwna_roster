class Position < ApplicationRecord
  belongs_to :person, optional: true

  validates :name,  presence: true
  validates :start, presence: true
  validates :stop,  presence: true
  validate :does_not_stop_before_start

  Officers = %w[ President Vice\ President Secretary Treasurer ]
  Chairs = %w[ Landscape Social Security New\ Member ]

  def self.names
  	[
  		['Officers', Officers],['Committee Chairs', Chairs]
    ]
  end

  def self.current_posns_for_person(person_id:)
  	Position.where("person_id = ? AND start <= '#{Date.current}' AND stop >= '#{Date.current}'", person_id)
  end

  def self.current_active_posns
  	Position.where("start <= '#{Date.current}' AND stop >= '#{Date.current}'")
  end

  def self.posns_active_in_interval(int_start:, int_stop:)
    Position.where("(start, stop) OVERLAPS (?, ?)", int_start, int_stop)
  end

  def person_name
  	return 'UnAssigned' unless person
  	person.fullname
  end

  def person_pref_phone
    return '' unless person
    person.preferred_phone
  end

  def person_pref_email
    return '' unless person
    person.preferred_email
  end

  def currently_active?
  	start <= Date.current && stop >= Date.current
  end

	private
	  def does_not_stop_before_start
	  	if start.present? && stop.present? && stop <= start
	  		errors.add(:stop, "must occur *after* Start")
	  	end
	  end
end
