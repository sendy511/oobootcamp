require 'ruby-debug'

class SmartParkingBoy < ParkingBoy
	def retrieve_satified_parkinglot
		@managed_parkinglots.max_by do |element|
			element.left_spaces
		end
	end
end