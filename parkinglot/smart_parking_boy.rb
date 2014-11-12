class SmartParkingBoy < ParkingBoy
	def retrieve_parkinglot_for_parking
		@managed_parkinglots.max_by do |element|
			element.left_spaces
		end
	end
end