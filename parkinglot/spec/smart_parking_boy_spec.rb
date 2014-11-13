require_relative '../rspec_helper'

class SmartParkingBoyProvider
	def initialize
	end

	def create_default
		SmartParkingBoy.new
	end

	def create_one(parkinglots)
		SmartParkingBoy.new(parkinglots)
	end
end

describe "Smart Parking Boy" do
	parking_boy_basic_validator(SmartParkingBoyProvider.new)

	describe "When there is only one parking lot" do
		it "should park to this parking lot" do
			parkinglot = Parkinglot.new
			smartParkingBoy = SmartParkingBoy.new([parkinglot])
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
			smartParkingBoy = SmartParkingBoy.new([parkinglot, biggerParkinglot])
			smartParkingBoy.park(car)
			expect(biggerParkinglot.pick(car.id)).to eq(car)
		end
	end

	it "should be able to park to the parking lot with more spaces" do
		parkinglot = Parkinglot.new(2)
		parkinglotMoreSpacesLeft = Parkinglot.new(2)
		parkinglot.park(Car.new("GA888888"))
		smartParkingBoy = SmartParkingBoy.new([parkinglot, parkinglotMoreSpacesLeft])
		car1 = Car.new("GA000000")
		smartParkingBoy.park(car1)
		expect(parkinglotMoreSpacesLeft.pick(car1.id)).to eq(car1)
	end

	it "should park to the first parking lot when parking lots have same spaces" do
		parkinglot1 = Parkinglot.new(1)
		parkinglot2 = Parkinglot.new(1)
		smartParkingBoy = SmartParkingBoy.new([parkinglot1, parkinglot2])
		car = Car.new()
		smartParkingBoy.park(car)
		expect(parkinglot1.pick(car.id)).to eq(car)
	end
end