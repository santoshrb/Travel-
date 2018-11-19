module EnquiriesHelper
	def all_enquiry
		if current_user.role.name == "Tellecaller"
			@booking = VehicleBooking.all.pluck(:enquiry_id)
			user = User.where(employee_id: current_user.employee_id).take
			Enquiry.where(user_id: user.id).where.not(id: @booking).collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
		elsif current_user.role.name == "GroupAdmin"
			@booking = VehicleBooking.all.pluck(:enquiry_id)
			Enquiry.where.not(id: @booking).collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
		else
			current_emp = Employee.find_by(id: current_user.employee_id)
			employee = Employee.where(branch_id: current_emp.branch_id).pluck(:id)
			user = User.where(employee_id: employee).pluck(:id)
			@booking = VehicleBooking.all.pluck(:enquiry_id)
			Enquiry.where(user_id: user).where.not(id: @booking).collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
		end
	end
end

