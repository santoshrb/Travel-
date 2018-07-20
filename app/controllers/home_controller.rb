class HomeController < ApplicationController
	def index
		enq_date = Date.today..(Date.today + 1)
		@enquiries = Enquiry.where(enquiry_date: enq_date.to_date) 
		@schemes = Scheme.all
		@vehicle_bookings = VehicleBooking.all
		@companies = Company.all
	end
end
