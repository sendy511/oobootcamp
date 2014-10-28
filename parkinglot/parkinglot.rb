require_relative "car"

class Parkinglot
	attr_accessor :parked_cars
	attr_accessor :capacity

	def initialize(capacity=100)
		@parked_cars = {}
		@capacity = capacity
	end

	def park(car)
		if @parked_cars.length >= @capacity then
			return false
		else
			parked_cars[car.id] = car
			return true
		end
	end

	def pick(car_id)
		if parked_cars.member?(car_id) then
			return parked_cars[car_id]
		else
			return false
		end
	end
end