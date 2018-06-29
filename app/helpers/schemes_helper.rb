module SchemesHelper
	def all_scheme_type
		Scheme.where(status: true).collect { |x| [x.name, x.id] }
	end
end
