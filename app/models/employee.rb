class Employee < ApplicationRecord
	belongs_to :company
	belongs_to :branch
	validates :first_name, presence:true,uniqueness:{case_sensitive:false}
	validates :last_name, presence:true,uniqueness:{case_sensitive:false}
	validates :code, presence:true,uniqueness:{case_sensitive:false}
	validates :email, presence:true,uniqueness:{case_sensitive:false}
	validates :company_id, presence:true,uniqueness:{case_sensitive:false}
	validates :branch_id, presence:true,uniqueness:{case_sensitive:false}
end
