class VehicleBooking < ActiveRecord::Base
	belongs_to :enquiry
	belongs_to :agent
	has_many :document_lists
	has_many :booking_communications
	belongs_to :executive, class_name: 'Employee'
    validates :enquiry_id, presence:true 
    validates :executive_id, presence:true
    validates :agent_id, presence:true
    validates :pan, presence:true
    validates :adhar, presence:true
end
