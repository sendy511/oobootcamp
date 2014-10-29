class ParkingHelper
	attr_accessor :parked_cars_with_parkinglot
	attr_accessor :managed_parkinglots

	def initialize(managed_parkinglots = [])
		@managed_parkinglots = []
		if managed_parkinglots.length == 0 then
			@managed_parkinglots.push Parkinglot.new
		else
			@managed_parkinglots = managed_parkinglots
		end

		@parked_cars_with_parkinglot = {}
	end

	def park(car)
		i = 0
		while i < @managed_parkinglots.length do
			if not @managed_parkinglots[i].full? then
				@parked_cars_with_parkinglot[car.id] = i;
				return @managed_parkinglots[i].park(car)
			end
			i += 1
		end
		return false
	end

	def pick(car_id)
		@managed_parkinglots.each do |parkinglot|
			pick_car_result = parkinglot.pick(car_id)
			if pick_car_result then
				return pick_car_result
			end
		end

		return false
	end
end