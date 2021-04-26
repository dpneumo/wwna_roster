class Person::GetPreferredEmail < ApplicationQuery
  def initialize(person_id)
  	@person_id = person_id
  end

  def call
  	Email.where(person_id: @person_id, preferred: true).first
  end
end