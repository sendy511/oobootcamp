class SuperSmartParkingBoy < ParkingBoy
protected
	def retrieve_parkinglot_for_parking
		(@managed_parkinglots.sort_by {
				|parkinglot| -(parkinglot.left_spaces)
			}).max_by do |element|
				element.spare_rate
			end
	end
end