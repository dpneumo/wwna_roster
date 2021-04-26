class Person::GetPreferredAddress< ApplicationQuery
  def initialize(person_id)
  	@person_id = person_id
  end

  def call
  	Address.where(person_id: @person_id, preferred: true).first
  end
end