json.extract! employee, :id, :code, :prefix, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :contact_no, :email, :blood_group, :address, :country, :state, :district, :city, :pin_code, :adhar_no, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
