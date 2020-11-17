class House < ApplicationRecord
  include Comparable

  has_many :occupants, class_name: 'Person'
  has_many :ownerships
  has_many :owners, through: :ownerships
  has_many :contributions

  validate :latitude_is_sane
  validate :longitude_is_sane

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

  private
      def latitude_is_sane
      return unless latitude
      if latitude > 90
        errors.add(:latitude, "is > 90 deg")
      elsif latitude < -90
        errors.add(:latitude, "is < -90 deg")
      end
    end

    def longitude_is_sane
      return unless longitude
      if longitude > 180
        errors.add(:longitude, "is > 180 deg")
      elsif longitude < -180
        errors.add(:longitude, "is < -180 deg")
      end
    end
end


