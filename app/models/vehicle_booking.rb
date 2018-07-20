class VehicleBooking < ActiveRecord::Base
	has_many :enquiries
	has_many :document_lists
  validates :pan, presence:true,uniqueness:{case_sensitive:false}
  validates :adhar, presence:true,uniqueness:{case_sensitive:false}
end
