json.extract! request_detail, :id, :request_id, :department_id, :turn, :quantity, :rrhh, :internal, :laborum, :trabajando, :created_at, :updated_at
json.url request_detail_url(request_detail, format: :json)
