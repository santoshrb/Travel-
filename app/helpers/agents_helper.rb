module AgentsHelper
	def all_agent
		Agent.all.collect { |x| [x.first_name, x.id] }
	end
end
