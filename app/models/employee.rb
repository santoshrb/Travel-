class Employee < ApplicationRecord
	belongs_to :company
	belongs_to :branch
	has_many :users
	has_many :document_lists
	validates :first_name, presence:true , length: {minimum: 3}
	#validates :last_name, presence:true
	# validates :code, presence:true,uniqueness:{case_sensitive:false}
	#validates :email, presence:true
	# validates :company_id, presence:true
	# validates :branch_id, presence:true
end
