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
