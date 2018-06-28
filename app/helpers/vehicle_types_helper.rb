module VehicleTypesHelper
	def all_vehicle_type
		VehicleType.where(status: true).collect { |x| [x.name, x.id] }
	end
end
