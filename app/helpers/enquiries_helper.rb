module EnquiriesHelper
	def all_enquiry
		@booking = VehicleBooking.all.pluck(:enquiry_id)
		Enquiry.where.not(id: @booking).collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
	end
end
