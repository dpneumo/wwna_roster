json.extract! person, :id, :nickname, :first, :middle, :last, :suffix, :honorific, :note, :house_id, :role, :status, :pref_email_id, :pref_phone_id, :pref_address_id, :created_at, :updated_at
json.url person_url(person, format: :json)
