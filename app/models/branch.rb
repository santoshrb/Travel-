class Branch < ApplicationRecord
	# has_many :employees
	belongs_to :company
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :code, presence:true,uniqueness:{case_sensitive:false}
end
