json.extract! house, :id, :number, :street, :lat, :lng, :image_link, :linked_lot_id, :flag, :rental, :listed, :status, :note, :created_at, :updated_at
json.url house_url(house, format: :json)
