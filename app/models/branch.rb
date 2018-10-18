class Branch < ApplicationRecord
	has_many :employees
	has_many :financer_masters
	has_many :fshowroom_masters
	belongs_to :company
	has_many :schemes
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :code, presence:true,uniqueness:{case_sensitive:false}
	#validates :company_id, presence:true
end
