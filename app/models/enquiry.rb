class Enquiry < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :scheme
  belongs_to :vehicle_booking
	belongs_to :user

  validates :name_first, presence:true
  validates :mobile_no, presence:true,uniqueness:{case_sensitive:false}
end
