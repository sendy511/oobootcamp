require_relative '../rspec_helper'

class SuperSmartParkingBoyProvider
	def initialize
	end

	def create_default
		SuperSmartParkingBoy.new
	end

	def create_one(parkinglots)
		SuperSmartParkingBoy.new(parkinglots)
	end
end

describe "Super Smart Parking Boy" do
	parking_boy_basic_validator(SuperSmartParkingBoyProvider.new)
	
	describe "When there is only one parking lot" do
		it "should park to this parking lot" do
			parkinglot = Parkinglot.new
			smartParkingBoy = SuperSmartParkingBoy.new([parkinglot])
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
			smartParkingBoy = SuperSmartParkingBoy.new([parkinglot, biggerParkinglot])
			smartParkingBoy.park(car)
			expect(biggerParkinglot.pick(car.id)).to eq(car)
		end
	end

	describe "when there are two parking lots with spare-rate as 50% and 100%" do
		it "should be able to park to 50% spare-rate parkinglot" do
			parkinglot_50_spare_rate = Parkinglot.new(2)
			parkinglot_50_spare_rate.park(Car.new)
			parkinglot_100_spare_rate = Parkinglot.new(2)
			super_smart_boy = SuperSmartParkingBoy.new([parkinglot_50_spare_rate, parkinglot_100_spare_rate])
			car = Car.new("GA888888")
			
			super_smart_boy.park(car)

			expect(parkinglot_100_spare_rate.pick(car.id)).to eq(car)
		end
	end

	describe "when there are two parking lots with different spare-rate and left-spaces" do
		it "should park to the parkinglot with high spare-rate" do
			parkinglot_with_high_spare_rate = Parkinglot.new(2)
			parkinglot_with_high_spare_rate.park(Car.new("11"))
			parkinglot_with_low_spare_rate = Parkinglot.new(5)
			parkinglot_with_low_spare_rate.park(Car.new("21"))
			parkinglot_with_low_spare_rate.park(Car.new("22"))
			parkinglot_with_low_spare_rate.park(Car.new("23"))
			super_smart_boy = SuperSmartParkingBoy.new([parkinglot_with_high_spare_rate, parkinglot_with_low_spare_rate])
			car = Car.new("24")

			super_smart_boy.park(car)

			expect(parkinglot_with_high_spare_rate.pick(car.id)).to eq(car)
		end
	end
end