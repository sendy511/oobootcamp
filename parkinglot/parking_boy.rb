class ParkingBoy
	attr_accessor :managed_parkinglots

	def initialize(managed_parkinglots = [])
		@managed_parkinglots = []
		if managed_parkinglots.length == 0 then
			@managed_parkinglots.push Parkinglot.new
		else
			@managed_parkinglots = managed_parkinglots
		end
	end

	def park(car)
		parkinglot = retrieve_satified_parkinglot
		if parkinglot then
		 return parkinglot.park(car)
		else
		 return false
		end
	end

	def pick(car_id)
		car = nil
		parkinglot = @managed_parkinglots.detect do |parkinglot|
			car = parkinglot.pick(car_id)
		end

		if parkinglot then
			return car
		else
			return false
		end
	end

	protected
	def retrieve_satified_parkinglot
		parkinglot = @managed_parkinglots.detect { |parkinglot|
			not parkinglot.full?
		}
	end
end