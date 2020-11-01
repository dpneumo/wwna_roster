class House < ApplicationRecord
  include Comparable

  has_many :occupants
  has_many :people, through: :occupants
  has_many :owners
  has_many :people, through: :owners
  has_many :contributions

  validate :latitude_is_sane
  validate :longitude_is_sane

  def street_number
    number + ' ' + street
  end

  def <=>(other)
    return -1 if self.lot.street < other.lot.street
    return +1 if self.lot.street > other.lot.street
    self.lot.number <=> other.lot.number
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


