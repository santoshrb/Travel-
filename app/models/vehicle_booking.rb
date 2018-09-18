class VehicleBooking < ActiveRecord::Base
	  belongs_to :enquiry
	has_many :document_lists
	has_many :booking_communications
	belongs_to :executive, class_name: 'Employee'
  validates :pan, presence:true,uniqueness:{case_sensitive:false}
  validates :adhar, presence:true,uniqueness:{case_sensitive:false}
  validates :enquiry_id, presence:true
end
