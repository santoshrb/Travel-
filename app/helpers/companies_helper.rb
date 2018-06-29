module CompaniesHelper
	def all_company
		Company.all.collect { |x| [x.name, x.id] }
	end
end
