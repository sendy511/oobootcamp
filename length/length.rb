class Length

	attr_accessor :value
	attr_accessor :unit

	def initialize(value = 0, unit = "")
		@value = value
		@unit = unit
	end

	def ==(value2)
		if @unit == "" || value2.unit == ""
				return @value == value2.value
		else
				return self.get_value_in_mm == value2.get_value_in_mm
		end
	end

	def get_value_in_mm()
		if @unit == "mm"
			return @value
		end
		if @unit == "cm"
			return @value * 10
		end
		if @unit == "m"
			return @value * 1000
		end

	end

end