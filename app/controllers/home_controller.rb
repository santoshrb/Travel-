class HomeController < ApplicationController
	def index
		enq_date = (Date.today - 1)..Date.today
		@enquiries = Enquiry.where(enquiry_date: enq_date) 
		@schemes = Scheme.all
		@vehicle_bookings = VehicleBooking.all
		@companies = Company.all
	end
end
