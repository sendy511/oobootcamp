require_relative "length.rb"
require "test/unit"

class LengthTest < Test::Unit::TestCase
	def test_empty
	end

	def test_length_exist
		length = Length.new
		assert_not_nil length
	end

	def test_length_can_equal
		length1 = Length.new(1)
		length2 = Length.new(1)
		assert_equal length1, length2
	end

	def test_length_support_unit
		length1 = Length.new(1, "m")
		assert_not_nil length1
	end

	def test_length_can_equal_with_unit
		length1 = Length.new(1, "m")
		length2 = Length.new(100, "cm")
		assert_equal(length1, length2)
	end
end