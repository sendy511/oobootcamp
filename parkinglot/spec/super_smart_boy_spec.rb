require_relative '../rspec_helper'

describe "Super Smart Parking Boy" do
	it "should be able park car" do
		parking_service = SuperSmartBoy.new
		car = Car.new
		expect(parking_service.park(car)).to eq(true)
	end

	it "should be able to pick parked car" do
		parking_service = SuperSmartBoy.new
		car = Car.new
		parking_service.park(car)
		expect(parking_service.pick(car.id)).to eq(car)
	end

	it "should not be able to park when all parking lots are full" do
		parkinglot1 = Parkinglot.new(0)
		parkinglot2 = Parkinglot.new(0)
		parking_service = SuperSmartBoy.new([parkinglot1, parkinglot2])

		car = Car.new

		expect(parking_service.park(car)).to eq(false)
	end

	it "should be able to pick a car which is parked by car owner" do
		parkinglot = Parkinglot.new
		car = Car.new
		parkinghelper = SuperSmartBoy.new([parkinglot])

		parkinglot.park(car)

		expect(parkinghelper.pick(car.id)).to eq(car)
	end

	it "should not be able to pick a car which is never parked" do
		parkinghelper = SuperSmartBoy.new
		expect(parkinghelper.pick("GA000000")).to eq(false)
	end

	it "should not be able to pick a car again after picked" do
		parkinghelper = SuperSmartBoy.new
		car = Car.new
		parkinghelper.park(car)

		parkinghelper.pick(car.id)

		expect(parkinghelper.pick(car.id)).to eq(false)
	end

	it "should still be able to park when only one is full but it manages two parking lots" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		parkinghelper = SuperSmartBoy.new([parkinglot1, parkinglot2])
		car1 = Car.new
		parkinghelper.park(car1)

		car2 = Car.new
		expect(parkinghelper.park(car2)).to eq(true)
	end

	it "should be able to pick correct cars when there are multiple parkinglots" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		parkinghelper = SuperSmartBoy.new([parkinglot1, parkinglot2])
		car1 = Car.new
		parkinghelper.park(car1)
		car2 = Car.new
		parkinghelper.park(car2)

		expect(parkinghelper.pick(car1.id)).to eq(car1)
		expect(parkinghelper.pick(car2.id)).to eq(car2)
	end

	describe "When there is only one parking lot" do
		it "should park to this parking lot" do
			parkinglot = Parkinglot.new
			smartParkingBoy = SuperSmartBoy.new([parkinglot])
			car = Car.new
			smartParkingBoy.park(car)
			expect(parkinglot.pick(car.id)).to eq(car)
		end
	end

	describe "When there are two empty parking lots" do
		it "should park to the bigger parking lots" do
			parkinglot = Parkinglot.new(1)
			biggerParkinglot = Parkinglot.new(2)
			car = Car.new
			smartParkingBoy = SuperSmartBoy.new([parkinglot, biggerParkinglot])
			smartParkingBoy.park(car)
			expect(biggerParkinglot.pick(car.id)).to eq(car)
		end
	end

	it "should be able to park to the parking lot with more spaces" do
		parkinglot = Parkinglot.new(2)
		parkinglotMoreSpacesLeft = Parkinglot.new(2)
		parkinglot.park(Car.new("GA888888"))
		smartParkingBoy = SuperSmartBoy.new([parkinglot, parkinglotMoreSpacesLeft])
		car1 = Car.new("GA000000")
		smartParkingBoy.park(car1)
		expect(parkinglotMoreSpacesLeft.pick(car1.id)).to eq(car1)
	end

	it "should park to the first parking lot when parking lots have same spaces" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		smartParkingBoy = SuperSmartBoy.new([parkinglot1, parkinglot2])
		car = Car.new()
		smartParkingBoy.park(car)
		expect(parkinglot1.pick(car.id)).to eq(car)
	end
end