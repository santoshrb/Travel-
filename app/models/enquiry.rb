class Enquiry < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :scheme
  validates :name_first, presence:true
  validates :mobile_no, presence:true,uniqueness:{case_sensitive:false}
end
