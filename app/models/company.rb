class Company < ApplicationRecord
	has_many :employees
	has_many :branches
	validates :name, presence:true,uniqueness:{case_sensitive:false}
	validates :code, presence:true,uniqueness:{case_sensitive:false}
	has_attached_file :logo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
