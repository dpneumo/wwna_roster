json.extract! email, :id, :person_id, :addr, :locn, :preferred, :note, :created_at, :updated_at
json.url email_url(email, format: :json)
