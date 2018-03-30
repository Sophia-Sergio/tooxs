json.extract! user, :id, :name, :lastname, :surname, :role, :picture, :status, :position, :rut, :created_at, :updated_at
json.url user_url(user, format: :json)
