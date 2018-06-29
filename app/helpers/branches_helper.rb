module BranchesHelper
	def all_branch
		Branch.all.collect { |x| [x.name, x.id] }
	end
end
