class VehicleBooking < ActiveRecord::Base
  validates :pan, presence:true,uniqueness:{case_sensitive:false}
  validates :adhar, presence:true,uniqueness:{case_sensitive:false}
end
