require_relative '../rspec_helper'

describe "parking_helper" do
	it "should be able park car" do
		parking_service = ParkingBoy.new
		car = Car.new
		expect(parking_service.park(car)).to eq(true)
	end

	it "should be able to pick parked car" do
		parking_service = ParkingBoy.new
		car = Car.new
		parking_service.park(car)
		expect(parking_service.pick(car.id)).to eq(car)
	end

	it "should not be able to park when all parking lots are full" do
		parkinglot1 = Parkinglot.new(0)
		parkinglot2 = Parkinglot.new(0)
		parking_service = ParkingBoy.new([parkinglot1, parkinglot2])

		car = Car.new

		expect(parking_service.park(car)).to eq(false)
	end

	it "should be able to pick a car which is parked by car owner" do
		parkinglot = Parkinglot.new
		car = Car.new
		parkinghelper = ParkingBoy.new([parkinglot])

		parkinglot.park(car)

		expect(parkinghelper.pick(car.id)).to eq(car)
	end

	it "should not be able to pick a car which is never parked" do
		parkinghelper = ParkingBoy.new
		expect(parkinghelper.pick("GA000000")).to eq(false)
	end

	it "should not be able to pick a car again after picked" do
		parkinghelper = ParkingBoy.new
		car = Car.new
		parkinghelper.park(car)

		parkinghelper.pick(car.id)

		expect(parkinghelper.pick(car.id)).to eq(false)
	end

	it "should still be able to park when only one is full but it manages two parking lots" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		parkinghelper = ParkingBoy.new([parkinglot1, parkinglot2])
		car1 = Car.new
		parkinghelper.park(car1)

		car2 = Car.new
		expect(parkinghelper.park(car2)).to eq(true)
	end

	it "should be able to pick correct cars when there are multiple parkinglots" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		parkinghelper = ParkingBoy.new([parkinglot1, parkinglot2])
		car1 = Car.new
		parkinghelper.park(car1)
		car2 = Car.new
		parkinghelper.park(car2)

		expect(parkinghelper.pick(car1.id)).to eq(car1)
		expect(parkinghelper.pick(car2.id)).to eq(car2)
	end
end