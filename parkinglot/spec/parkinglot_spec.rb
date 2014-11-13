require_relative '../rspec_helper'

def parking_provider_basic_validation(parkinglot_provider)
	it "should be able to park car" do
		parkinglot = parkinglot_provider.create_default
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(true)
	end

	it "should be able to pick parked car" do
		parkinglot = parkinglot_provider.create_default
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick(car1.id)).to eq(car1)
	end

	it "should not be able to park car when full" do
		parkinglot = parkinglot_provider.create_one(0)
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(false)
	end

	it "should not be able to pick an unpacked car" do
		parkinglot = parkinglot_provider.create_default
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick("GA-000000")).to eq(false)
	end

	it "should not be able to pick car again after picked" do
		parkinglot = parkinglot_provider.create_default
		car = Car.new("GA-888888")
		parkinglot.park(car)
		parkinglot.pick(car.id)
		expect(parkinglot.pick(car.id)).to eq(false)
	end

	it "should be able to park again after a car is picked when the parkinglot is full" do
		parkinglot = parkinglot_provider.create_one(1)
		car1 = Car.new("GA-888888")
		car2 = Car.new("GA-666666")
		parkinglot.park(car1)
		expect(parkinglot.park(car2)).to eq(false)

		parkinglot.pick(car1.id)
		expect(parkinglot.park(car2)).to eq(true)

	end
end

class ParkingLotsProvider
	def initialize
	end
	
	def create_default
		Parkinglot.new
	end

	def create_one(capacity)
		Parkinglot.new(capacity)
	end
end

describe "parkinglot" do 
	parking_provider_basic_validation(ParkingLotsProvider.new)
end