class Ownership < ApplicationRecord
  belongs_to :property, class_name: 'House', foreign_key: :house_id
  belongs_to :owner, class_name: 'Person', foreign_key: :person_id

  validates :house_id,  presence: true
  validates :person_id, presence: true

  def house_address
    property.house_address
  end

  def owner_name
    owner.fullname
  end
end
