json.extract! person, :id, :nickname, :first, :middle, :last, :suffix, :honorific, :note, :house_id, :relation, :status, :created_at, :updated_at
json.url person_url(person, format: :json)
