class HousePresenter < ApplicationPresenter
  def statuses
    Enums.house_statuses
  end

  def street_names
    House.all.collect {|house| house.street }.uniq
  end

  def for_select
    House.all.reduce({}) do |acc,house|
      acc[house.street] ||= []
      acc[house.street] << [house.number, house.id ]
      acc
    end
  end

  def select_list
    House.all.map {|h| [addr(h), h.id] }
  end

  def house_address
    addr(__getobj__)
  end

  def linked_lot_addresses
    return '' unless lots
    lots
      .map {|lot| HousePresenter.new(lot,nil).house_address }
      .join('; ')
  end

  def err_msgs
    errors.full_messages
  end

  def contributions(year: Date.current.year)
    contribs = Contributions::GetForHouseAndYear.call(house_id, year)
    contribs.reduce(0) {|sum,c| sum+c.amount_cents }
  end

  def occupants
  	Person.where("house_id = ?", id)
  end

private
  def addr(house)
    house.number + ' ' + house.street
  end

  def house_id
    id
  end
end
