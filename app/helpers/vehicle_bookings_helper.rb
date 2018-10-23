module VehicleBookingsHelper
	def all_vehicle_booking
		VehicleBooking.all.collect { |x| [x.enquiry.name_first.to_s+' '+x.enquiry.last_name+' - '+x.enquiry.mobile_no, x.id] }
	end
end
