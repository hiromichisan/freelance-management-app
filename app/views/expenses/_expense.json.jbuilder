json.extract! expense, :id, :description, :amount, :category, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
