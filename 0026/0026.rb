# require 'minitest/autorun'
require 'minitest'

class Square
  attr_reader :squares

  def initialize
    @squares = build_two_dimensions
  end

  def build_two_dimensions
    Array.new(10) { [] }.map { Array.new(10) { 0 } }
  end

  def update(x, y, size)
    range = case size
            when 1
              small_range
            when 2
              middle_range
            when 3
              large_range
            else
              []
            end

    range.each do |a, b|
      increment(x + a, y + b)
    end
  end

  def zero_count
    squares.flatten.select(&:zero?).count
  end

  def max
    squares.flatten.max
  end

  private

  def large_range
    middle_range.concat [[-2, 0], [0, -2], [0, 2], [2, 0]]
  end

  def middle_range
    small_range.concat [-1, 1].product([1, -1])
  end

  def small_range
    [[-1, 0], [0, -1], [0, 0], [0, 1], [1, 0]]
  end

  def increment(x, y)
    squares[x][y] += 1 if x.between?(0, 9) && y.between?(0, 9)
  end
end

lines = STDIN.read.split("\n")
square = Square.new
lines.each do |line|
  x, y, size = line.split(',').map(&:to_i)
  square.update(x, y, size)
end
puts square.zero_count
puts square.max

class SquareTest < Minitest::Test
  def setup
    @square = Square.new
    @squares = @square.build_two_dimensions
  end

  def test_small
    @squares[0][1] = 1
    @squares[1][0] = 1
    @squares[1][1] = 1
    @squares[1][2] = 1
    @squares[2][1] = 1

    @square.update(1, 1, 1)
    assert_equal @squares, @square.squares
  end

  def test_middle
    @squares[0][0] = 1
    @squares[0][1] = 1
    @squares[0][2] = 1
    @squares[1][0] = 1
    @squares[1][1] = 1
    @squares[1][2] = 1
    @squares[2][0] = 1
    @squares[2][1] = 1
    @squares[2][2] = 1

    @square.update(1, 1, 2)
    assert_equal @squares, @square.squares
  end

  def test_small_and_middle
    @squares[0][0] = 1
    @squares[0][2] = 1
    @squares[2][0] = 1
    @squares[2][2] = 1
    @squares[0][1] = 2
    @squares[1][0] = 2
    @squares[1][1] = 2
    @squares[1][2] = 2
    @squares[2][1] = 2

    (1..2).each do |i|
      @square.update(1, 1, i)
    end
    assert_equal @squares, @square.squares
  end

  def test_large
    [
      [0, 2],
      [1, 1],
      [1, 2],
      [1, 3],
      [2, 0],
      [2, 1],
      [2, 2],
      [2, 3],
      [2, 4],
      [3, 1],
      [3, 2],
      [3, 3],
      [4, 2]
    ].each do |x, y|
      @squares[x][y] = 1
    end

    @square.update(2, 2, 3)
    assert_equal @squares, @square.squares
  end

  def test_zero_count
    @square.update(1, 1, 1)
    assert_equal 95, @square.zero_count
  end

  def test_max
    @square.update(1, 1, 1)
    assert_equal 1, @square.max
  end
end
