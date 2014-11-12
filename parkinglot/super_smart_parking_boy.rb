class SuperSmartParkingBoy < ParkingBoy
	def retrieve_satified_parkinglot
		(@managed_parkinglots.sort_by {
				|parkinglot| -(parkinglot.left_spaces)
			}).max_by do |element|
				element.spare_rate
			end
	end
end