require 'ruby-debug'

class SmartParkingBoy < ParkingHelper
	def park(car)
		biggestParkinglot = @managed_parkinglots.max_by do |element|
			element.left_spaces
		end
		return biggestParkinglot.park(car)
	end
end