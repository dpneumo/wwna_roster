json.extract! occupancy, :id, :house_id, :person_id, :relation, :status, :note, :created_at, :updated_at
json.url occupancy_url(occupancy, format: :json)
