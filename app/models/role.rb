class Role < ActiveRecord::Base
	has_many :employees
	has_many :users
end
