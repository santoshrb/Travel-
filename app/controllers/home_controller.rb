class HomeController < ApplicationController
	def index
		date_yest = (Date.today - 1).to_date
		@enquiry_yest = Enquiry.where(enquiry_date: date_yest) 
		@enquiry_today = Enquiry.where(enquiry_date: Date.today) 
		@enquiry_yest = Enquiry.where(enquiry_date: date_yest,user_id: current_user.employee_id) 
		@enquiry_today = Enquiry.where(enquiry_date: Date.today,user_id: current_user.employee_id) 
		@schemes = Scheme.all
		@vehicle_bookings = VehicleBooking.all
		@companies = Company.all
		@todays_all_enquiry = Enquiry.where(enquiry_date: Date.today)
		@userwise_all_enquiry = Enquiry.where(enquiry_date: Date.today).group(:user_id)

		@branch_todays_enquiry = Enquiry.where(enquiry_date: Date.today,user_id: current_user.id)
	end
end
