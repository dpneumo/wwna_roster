# frozen_string_literal: true

class PositionPresenter < ApplicationPresenter
  def person_selectlist
    PersonPresenter.new(nil, nil).select_list
  end

  def position_names
    [['Officers', Enums.officers], ['Committee Chairs', Enums.chairs]]
  end

  def person_name
    return 'UnAssigned' unless person

    PersonPresenter.new(person, nil).informal_name
  end

  def currently_active?
    position.date_range.includes_date? Date.current
  end

  def person_pref_phone
    ph = Person::GetPreferredPhone.call(person.id)
    ph.nil? ? '' : PhonePresenter.new(ph, nil).ph_number
  end

  def person_pref_email
    em = Person::GetPreferredEmail.call(person.id)
    em.nil? ? '' : EmailPresenter.new(em, nil).addr
  end
end
