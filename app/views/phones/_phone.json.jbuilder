json.extract! phone, :id, :person_id, :cc, :area, :prefix, :number, :phone_type, :preferred, :txt_capable, :note, :created_at, :updated_at
json.url phone_url(phone, format: :json)
