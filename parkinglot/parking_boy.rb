class ParkingBoy
	attr_accessor :managed_parkinglots

	def initialize(managed_parkinglots = [])
		@managed_parkinglots = 
		managed_parkinglots.length == 0 ? [Parkinglot.new] : managed_parkinglots
	end

	def park(car)
		retrieve_parkinglot_for_parking ? retrieve_parkinglot_for_parking.park(car) : false
	end

	def pick(car_id)
		car = nil
		@managed_parkinglots.detect do |parkinglot|
			car = parkinglot.pick(car_id)
		end
		car ? car : false
	end

	protected
	def retrieve_parkinglot_for_parking
		@managed_parkinglots.detect { |parkinglot|
			not parkinglot.full?
		}
	end
end