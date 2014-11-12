class ParkingBoy
	attr_accessor :managed_parkinglots

	def initialize(managed_parkinglots = [])
		@managed_parkinglots = 
		managed_parkinglots.length == 0 ? [Parkinglot.new] : managed_parkinglots
	end

	def park(car)
		if retrieve_parkinglot_for_parking then
		 return retrieve_parkinglot_for_parking.park(car)
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
	def retrieve_parkinglot_for_parking
		parkinglot = @managed_parkinglots.detect { |parkinglot|
			not parkinglot.full?
		}
	end
end