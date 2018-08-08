class Scheme < ApplicationRecord
	belongs_to :vehicle_type
	has_many :enquiries
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :scheme_type, presence:true
	validates :budget, presence:true
	validates :down_payment, presence:true
	validates :installment, presence:true
	validates :intrest, presence:true
	# validates :status, presence:true

	has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	has_attached_file :image1, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
end
