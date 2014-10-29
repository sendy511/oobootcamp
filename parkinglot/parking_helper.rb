class ParkingHelper
	attr_accessor :parked_cars_with_parkinglot
	attr_accessor :managed_parkinglots

	def initialize(managed_parkinglots = [])
		@managed_parkinglots = []
		if managed_parkinglots.length == 0 then
			@managed_parkinglots += Parkinglot.new
		else
			@managed_parkinglots += managed_parkinglots
		end

		@parked_cars_with_parkinglot = {}
	end

	def park(car)
		@parked_cars_with_parkinglot[car.id] = 1;
		return @managed_parkinglots[0].park(car)
	end

	def pick(car_id)
		return @managed_parkinglots[0].pick(car_id)
	end
end