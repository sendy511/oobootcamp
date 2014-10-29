require_relative '../rspec_helper'

describe "parkinglot" do 
	it "should be able to park car" do
		parkinglot = Parkinglot.new
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(true)
	end

	it "should not be able to park car when full" do
		parkinglot = Parkinglot.new(0)
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(false)
	end

	it "should not be able to pick car again after picked" do
		parkinglot = Parkinglot.new()
		car = Car.new("GA-888888")
		parkinglot.park(car)
		parkinglot.pick(car.id)
		expect(parkinglot.pick(car.id)).to eq(false)
	end

	it "should be able to park again after a car is picked when the parkinglot is full" do
		parkinglot = Parkinglot.new(1)
		car1 = Car.new("GA-888888")
		car2 = Car.new("GA-666666")
		parkinglot.park(car1)
		expect(parkinglot.park(car2)).to eq(false)

		parkinglot.pick(car1.id)
		expect(parkinglot.park(car2)).to eq(true)

	end

	it "should be able to pick parked car" do
		parkinglot = Parkinglot.new
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick(car1.id)).to eq(car1)
	end

	it "should not be able to pick an unpacked car" do
		parkinglot = Parkinglot.new
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick("GA-000000")).to eq(false)
	end

end

describe "parking_helper" do
	it "should be able park car" do
		parking_service = ParkingHelper.new
		car = Car.new
		expect(parking_service.park(car)).to eq(true)
	end

	it "should be able to pick parked car" do
		parking_service = ParkingHelper.new
		car = Car.new
		parking_service.park(car)
		expect(parking_service.pick(car.id)).to eq(car)
	end

	it "should not be able to park when all parking lots are full" do
		parkinglot1 = Parkinglot.new(0)
		parkinglot2 = Parkinglot.new(0)
		parking_service = ParkingHelper.new([parkinglot1, parkinglot2])

		car = Car.new

		expect(parking_service.park(car)).to eq(false)
	end

	it "should be able to pick a car which is not parked by him" do
		parkinglot = Parkinglot.new
		car = Car.new
		parkinghelper = ParkingHelper.new([parkinglot])

		parkinglot.park(car)

		expect(parkinghelper.pick(car.id)).to eq(car)
	end

	it "should not be able to pick a car which is never parked" do
		parkinghelper = ParkingHelper.new
		expect(parkinghelper.pick("GA000000")).to eq(false)
	end

	it "should not be able to pick a car again after picked" do
		parkinghelper = ParkingHelper.new
		car = Car.new
		parkinghelper.park(car)

		parkinghelper.pick(car.id)

		expect(parkinghelper.pick(car.id)).to eq(false)
	end

	it "should still be able to park when only one is full but it manages two parking lots" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		parkinghelper = ParkingHelper.new([parkinglot1, parkinglot2])
		car1 = Car.new
		parkinghelper.park(car1)

		car2 = Car.new
		expect(parkinghelper.park(car2)).to eq(true)
	end
end