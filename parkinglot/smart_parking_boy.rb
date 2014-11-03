require 'ruby-debug'

class SmartParkingBoy

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
		biggestParkinglot = @managed_parkinglots.max_by do |element|
			element.left_spaces
		end
		return biggestParkinglot.park(car)
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