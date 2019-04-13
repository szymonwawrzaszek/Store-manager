json.extract! warehouse, :id, :name, :address, :phone_num, :email, :type, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
