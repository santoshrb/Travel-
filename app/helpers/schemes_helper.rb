module SchemesHelper
	def all_scheme_type
		Scheme.all.collect { |x| [x.name, x.id] }
	end
end
