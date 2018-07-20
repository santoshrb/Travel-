class HomeController < ApplicationController
	def index
		date_yest = (Date.today - 1).to_date
		@enquiry_yest = Enquiry.where(enquiry_date: date_yest) 
		@enquiry_today = Enquiry.where(enquiry_date: Date.today) 
		@schemes = Scheme.all
		@vehicle_bookings = VehicleBooking.all
		@companies = Company.all
	end
end
