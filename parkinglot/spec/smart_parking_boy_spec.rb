require_relative '../rspec_helper'

describe "Smart Parking Boy" do
	describe "When there is only one parking lot" do
		it "should park to this parking lot" do
			parkinglot = Parkinglot.new
			smartParkingBoy = SmartParkingBoy.new([parkinglot])
			car = Car.new
			smartParkingBoy.park(car)
			expect(parkinglot.pick(car.id)).to eq(car)
		end
	end
end