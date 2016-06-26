# require 'minitest/autorun'
require 'minitest'

class ModeValue
  def mode(array)
    result = array.each_with_object(Hash.new(0)) { |i, h| h[i] += 1 }
    max = result.values.max
    result.select { |_, v| v == max }.keys.sort
  end
end

puts ModeValue.new.mode(STDIN.read.split("\n").map(&:to_i))

class ModeValueTest < Minitest::Test
  def setup
    @mode_value = ModeValue.new
  end

  def test_one_value
    array = [1, 2, 1]
    actual = @mode_value.mode array
    assert_equal([1], actual)
  end

  def test_two_values
    array = [3, 1, 2, 1, 3]
    actual = @mode_value.mode array
    assert_equal([1, 3], actual)
  end
end
