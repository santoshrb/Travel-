json.extract! company, :id, :code, :name, :address, :country, :state, :district, :city, :pin_code, :email, :contact_no, :status, :created_at, :updated_at
json.url company_url(company, format: :json)
