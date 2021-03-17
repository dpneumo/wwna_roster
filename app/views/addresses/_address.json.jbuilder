json.extract! address, :id, :person_id, :number, :street, :city, :state, :zip, :address_type, :preferred, :note, :created_at, :updated_at
json.url address_url(address, format: :json)
