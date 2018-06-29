class Scheme < ApplicationRecord
	belongs_to :vehicle_type
	has_many :enquiries
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :scheme_type, presence:true
	validates :status, presence:true
end
