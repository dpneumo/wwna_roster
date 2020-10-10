json.extract! occupant, :id, :house_id, :person_id, :relation, :status, :note, :created_at, :updated_at
json.url occupant_url(occupant, format: :json)
