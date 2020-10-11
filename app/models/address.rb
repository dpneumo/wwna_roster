class Address < ApplicationRecord
  has_many :person_addresses
  has_many :people, through: :person_addresses
  has_one :house

  validates :number, presence: true
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :zip,    presence: true
  validate :latitude_is_sane
  validate :longitude_is_sane

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
