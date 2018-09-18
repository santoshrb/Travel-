module EmployeesHelper
	def all_employee
		Employee.all.collect {|e| [e.try(:code).to_s + ' ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
	end
end
