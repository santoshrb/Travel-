class Inword < ActiveRecord::Base
  belongs_to :vehicle_booking
  belongs_to :employee
  validates :date, presence:true
end
