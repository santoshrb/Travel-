class VehicleType < ApplicationRecord
	has_many :schemes
	has_many :enquiries
end
