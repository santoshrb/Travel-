class Enquiry < ApplicationRecord
	belongs_to :vehicle_type
	validates :name_first, presence:true
	validates :mobile_no, presence:true,uniqueness:{case_sensitive:false}
end
