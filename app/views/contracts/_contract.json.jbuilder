json.extract! contract, :id, :title, :content, :user_id, :created_at, :updated_at
json.url contract_url(contract, format: :json)
