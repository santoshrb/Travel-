module RolesHelper
	def all_role
		Role.all.collect {|e| [e.try(:code).to_s + ' ' + e.try(:name).to_s , e.id]}
	end
end
