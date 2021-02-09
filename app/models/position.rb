class Position < ApplicationRecord
  belongs_to :person, optional: true

  validates :name,  presence: true
  validates :start, presence: true
  validates :stop,  presence: true
  validate :cannot_stop_before_start

  Officers = %w[ President Vice\ President Secretary Treasurer ]
  Chairs = %w[ Landscape Social Security New\ Member ]

  def self.names
  	[
  		['Officers', Officers],['Committee Chairs', Chairs]
    ]
  end

  def person_name
  	return 'UnAssigned' unless person
  	person.fullname
  end

  def cannot_stop_before_start
  	if start.present? && stop.present? && stop <= start
  		errors.add(:stop, "must occur *after* Start")
  	end
  end
end
