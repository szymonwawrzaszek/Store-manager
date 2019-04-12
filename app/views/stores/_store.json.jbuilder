json.extract! store, :id, :name, :address, :phone_num, :email, :opening_hours, :created_at, :updated_at
json.url store_url(store, format: :json)
