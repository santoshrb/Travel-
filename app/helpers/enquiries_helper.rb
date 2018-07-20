module EnquiriesHelper
	def all_enquiry
		Enquiry.all.collect { |x| [x.mobile_no + ' - ' + x.name_first, x.id] }
	end
end
