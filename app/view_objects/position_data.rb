class PositionData
  delegate  :id, :name, :date_range, :person_id, :person,
            to: :@position

  attr_reader :position
  def initialize(position)
  	@position = position
  end

  def person_selectlist
  	Person.select_list
  end

  def position_names
  	[ ['Officers', Enums.officers],['Committee Chairs', Enums.chairs] ]
  end

  def person_name
  	return 'UnAssigned' unless person
  	person.fullname
  end

  def currently_active?
    position.date_range.includes_date? Date.current
  end

  def person_pref_phone
    return '' unless person
    person.preferred_phone
  end

  def person_pref_email
    return '' unless person
    person.preferred_email
  end
end