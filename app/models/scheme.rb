class Scheme < ApplicationRecord
	belongs_to :vehicle_type
	has_many :enquiries
end
