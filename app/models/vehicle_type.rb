class VehicleType < ApplicationRecord
	has_many :schemes
	has_many :enquiries
  validates :name, presence:true,uniqueness:{case_sensitive:false}
end
