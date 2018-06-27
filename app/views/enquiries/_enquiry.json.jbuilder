json.extract! enquiry, :id, :mobile_no, :name_first, :middle_name, :last_name, :email, :address, :place, :user, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
