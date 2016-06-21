# require 'minitest/autorun'
require 'minitest'

class Mss
  def max(list)
    max = -100_000
    max_minus = -100_000
    next_val = 0
    list.each do |input|
      next_val = [input + next_val, 0].max
      max_minus = [input, max_minus].max
      max = [max, next_val].max
    end
    max_minus < 0 ? max_minus : max
  end
end

inputs = STDIN.read.split("\n").map { |e| e.chomp.to_i }

loop do
  n = inputs.shift
  break if n == 0

  list = Array.new(n) { inputs.shift }
  puts Mss.new.max(list)
end

class Test < Minitest::Test
  def setup
    @mss = Mss.new
  end

  def test_case_one
    list = %w(-5 -1 6 4 9 -6 -7)
    assert_equal 19, @mss.max(list.map(&:to_i))
  end

  def test_case_two
    list = %w(1 2 3 2 -2 -1 1 2 3 2 1 -2 1)
    assert_equal 14, @mss.max(list.map(&:to_i))
  end

  def test_case_three
    list = %w(1000 -200 201)
    assert_equal 1001, @mss.max(list.map(&:to_i))
  end

  def test_case_minus
    list = %w(-1 -2)
    assert_equal(-1, @mss.max(list.map(&:to_i)))
  end
end
