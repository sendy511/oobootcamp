require_relative '../rspec_helper'

describe "Parkinglot" do 
	it "should be able to park car" do
		parkinglot = Parkinglot.new
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(true)
	end

	it "should be able to pick parked car" do
		parkinglot = Parkinglot.new
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick(car1.id)).to eq(car1)
	end

	it "should not be able to park car when full" do
		parkinglot = Parkinglot.new(0)
		car1 = Car.new
		expect(parkinglot.park(car1)).to eq(false)
	end

	it "should not be able to pick an unpacked car" do
		parkinglot = Parkinglot.new
		car1 = Car.new("GA-888888")
		parkinglot.park(car1)
		expect(parkinglot.pick("GA-000000")).to eq(false)
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
end

