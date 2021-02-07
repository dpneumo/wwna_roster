class House < ApplicationRecord
  include Comparable

  has_many :occupants,
            -> { order(last: :asc, first: :asc, middle: :asc) },
            class_name: 'Person'
  has_many :ownerships
  has_many :owners,
            -> { order(last: :asc, first: :asc, middle: :asc) },
            through: :ownerships
  has_many :contributions, -> { order(date_paid: :asc) }

  validate :lat_is_sane
  validate :lng_is_sane

  Statuses = ["Occupied","Vacant","Construction"]

  def self.statuses
    Statuses
  end

  def self.street_names
    all.collect {|house| house.street }.uniq
  end

  def self.for_select
    all.reduce({}) do |acc,house|
      acc[house.street] ||= []
      acc[house.street] << [house.number, house.id ]
      acc
    end
  end

  def self.select_list
    all.map {|house| [house.house_address, house.id] }
  end

  def house_address
    number + ' ' + street
  end

  def err_msgs
    errors.full_messages
  end

  def <=>(other)
    return -1 if self.street < other.street
    return +1 if self.street > other.street
    self.number <=> other.number
  end

  def contrib
    Contribution.for(house_id: id, year: Date.today.year)
  end

  private

    def lat_is_sane
      return unless lat
      if lat > 90
        errors.add(:lat, "is > 90 deg")
      elsif lat < -90
        errors.add(:lat, "is < -90 deg")
      end
    end

    def lng_is_sane
      return unless lng
      if lng > 180
        errors.add(:lng, "is > 180 deg")
      elsif lng < -180
        errors.add(:lng, "is < -180 deg")
      end
    end
end


