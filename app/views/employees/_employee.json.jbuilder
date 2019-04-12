json.extract! employee, :id, :store_id, :name, :surname, :phone_num, :email, :position, :work_time, :created_at, :updated_at
json.url employee_url(employee, format: :json)
