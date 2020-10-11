json.extract! address, :id, :number, :street, :city, :state, :zip, :latitude, :longitude, :image_link, :note, :created_at, :updated_at
json.url address_url(address, format: :json)
