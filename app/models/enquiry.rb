class Enquiry < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :scheme
  has_many :vehicle_bookings
	belongs_to :user

  validates :name_first, presence:true
  validates :mobile_no, presence:true,uniqueness:{case_sensitive:false}
  #validates :email, presence:true,uniqueness:{case_sensitive:false}
end
