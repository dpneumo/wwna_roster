class Position < ApplicationRecord
  belongs_to :person, optional: true

  validates :name,  presence: true
  validates :start, presence: true
  validates :stop,  presence: true
  validate :does_not_stop_before_start


  def date_range
    DateRange.new(start, stop)
  end

  def date_range=(date_range)
    self.start = date_range.start
    self.stop  = date_range.stop
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

	private
	  def does_not_stop_before_start
	  	if start.present? && stop.present? && stop <= start
	  		errors.add(:stop, "must occur *after* Start")
	  	end
	  end
end
