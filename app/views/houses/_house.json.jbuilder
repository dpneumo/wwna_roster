json.extract! house, :id, :number, :street, :lat, :lng, :image_link, :flag, :rental, :listed, :status, :current_dues, :note, :created_at, :updated_at
json.url house_url(house, format: :json)
