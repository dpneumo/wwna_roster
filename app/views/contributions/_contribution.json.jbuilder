json.extract! contribution, :id, :house_id, :date_paid, :amount, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)
