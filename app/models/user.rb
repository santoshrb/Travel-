class User < ApplicationRecord
	# rolify
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	belongs_to :employee
	has_many :enquiries
	devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable
	
	def already_likes?(post)
		self.post_likes.find(:all, :conditions => ['post_id = ?', post.id]).size > 0
	end
end
