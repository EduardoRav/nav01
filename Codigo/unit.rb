require 'minitest/autorun'
require_relative 'apiTest'


class TestSource < Minitest::Test

	def test_code
		testFunction = $testCode
		assert_equal '200', $testCode
	end

end