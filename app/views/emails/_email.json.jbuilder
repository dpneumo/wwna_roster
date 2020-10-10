json.extract! email, :id, :addr, :note, :created_at, :updated_at
json.url email_url(email, format: :json)
