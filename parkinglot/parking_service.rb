class ParkingService
	attr_accessor :parked_cars_with_parkinglot
	attr_accessor :parkinglot_list

	def initialize(managed_parkinglots = [])
		@parkinglot_list = []
		if managed_parkinglots.length == 0 then
			@parkinglot_list.push Parkinglot.new
		else
			@parkinglot_list = managed_parkinglots
		end

		@parked_cars_with_parkinglot = {}
	end

	def park(car)
		@parked_cars_with_parkinglot[car.id] = 1;
		return @parkinglot_list[0].park(car)
	end

	def pick(car_id)
		return @parkinglot_list[0].pick(car_id)
	end
end