require 'ruby-debug'

class SuperSmartBoy < ParkingHelper
	def park(car)
		biggestParkinglot = (@managed_parkinglots.sort_by {
			|parkinglot| -(parkinglot.left_spaces)
		}).max_by do |element|
			element.spare_rate
		end
		return biggestParkinglot.park(car)
	end
end