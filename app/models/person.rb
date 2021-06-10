# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :addresses, -> { order(state: :asc, city: :asc, street: :asc, number: :asc) }
  has_many :emails, -> { order(addr: :asc) }
  has_many :phones, -> { order(cc: :asc, area: :asc, prefix: :asc, number: :asc) }
  belongs_to :house, optional: true
  has_many :ownerships
  has_many :properties, through: :ownerships
  has_many :positions

  validates :first, presence: true
  validates :last,  presence: true

  delegate  :fullname, :sortable_name, :informal_name, :formal_name,
            to: :person_name

  # Should this move to PersonPresenter?
  def person_name
    PersonName.new(first, middle, last, nickname, suffix, honorific)
  end

  def person_name=(person_name)
    self.nickname = person_name.nickname
    self.first = person_name.first
    self.middle = person_name.middle
    self.last = person_name.last
    self.suffix = person_name.suffix
    self.honorific = person_name.honorific
  end
end
