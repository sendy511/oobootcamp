require_relative "../length.rb"
require "test/unit"

class LengthTest < Test::Unit::TestCase
	def test_empty
	end

	def test_length_exist
		length = Length.new
		assert_not_nil length
	end

	def test_lenght_can_equal
		length1 = Length.new(1)
		length2 = Length.new(1)
		assert_equal(length1, length2)
	end
end