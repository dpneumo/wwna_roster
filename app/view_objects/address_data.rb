class AddressData
  delegate  :id, :errors, 
            :person_id, :address_type, :preferred, :note, 
            :number, :street, :city, :state, :zip,
            to: :@address

	attr_reader :address
	def initialize(address)
		@address = address
	end

  def types
    Enums.address_types
  end

  def complete_address
    "#{number} #{street}, #{city}, #{state} #{zip}"
  end

  def addressee
  	return 'Unknown' unless address.person
    address.person.fullname
  end

  def persons_list
  	Person.select_list
  end
end