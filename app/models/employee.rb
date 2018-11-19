class Employee < ApplicationRecord
	belongs_to :company
	belongs_to :branch
	has_many :users
	has_many :document_lists
	belongs_to :role
	has_many :vehicle_bookings, class_name: "Employee",
                          foreign_key: "executive_id"

    has_many :subordinates, class_name: 'Employee',
                          foreign_key: 'manager_id'
  	belongs_to :manager, class_name: 'Employee'

  	has_many :indirect_subordinates, class_name: 'Employee',
                                   foreign_key: 'manager_2_id'
  	belongs_to :manager_2, class_name: 'Employee'

	validates :first_name, presence:true , length: {minimum: 3}
	#validates :last_name, presence:true
	# validates :code, presence:true,uniqueness:{case_sensitive:false}
	validates :email, presence:true
	validates :company_id, presence:true
	validates :branch_id, presence:true
end
