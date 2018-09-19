class Agent < ActiveRecord::Base
  has_many :vehicle_bookings
  validates :first_name, presence:true
  validates :mobile_number, presence:true
end
