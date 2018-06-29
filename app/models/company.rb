class Company < ApplicationRecord
	# has_many :employees
	has_many :branches
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :code, presence:true,uniqueness:{case_sensitive:false}
end
