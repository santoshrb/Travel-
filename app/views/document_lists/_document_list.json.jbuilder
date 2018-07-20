json.extract! document_list, :id, :employee_id, :document_master_id, :vehicle_booking_id, :status, :created_at, :updated_at
json.url document_list_url(document_list, format: :json)
