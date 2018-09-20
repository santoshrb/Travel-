module EnquiriesHelper
	def all_enquiry
		@booking = VehicleBooking.all.pluck(:enquiry_id)
		user = User.where(employee_id: current_user.employee_id).take
		Enquiry.where(user_id: user.id).collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
	end
end
