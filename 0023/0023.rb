# require 'minitest/autorun'
require 'minitest'

class Circle
  def compare(list)
    xa, ya, ra, xb, yb, rb = list
    cd = center_distance(xa, ya, xb, yb)
    return 0  if cd > ra + rb
    return 2  if cd + rb < ra
    return -2 if cd + ra < rb
    1
  end

  def center_distance(xa, ya, xb, yb)
    ((ya - yb)**2 + (xa - xb)**2)**(1 / 2.0)
  end
end

n = STDIN.gets.chomp.to_i
inputs = STDIN.read.split("\n").map do |e|
  e.split.map { |ee| ee.chomp.to_f }
end

n.times do |i|
  puts Circle.new.compare(inputs[i])
end

class Test < Minitest::Test
  def setup
    @circle = Circle.new
  end

  def test_a_in_b
    list = [0.0, 0.0, 4.0, 0.0, 0.0, 5.0]
    assert_equal(-2, @circle.compare(list))
  end

  def test_b_in_a
    list = [0.0, 0.0, 5.0, 0.0, 0.0, 4.0]
    assert_equal 2, @circle.compare(list)
  end

  def test_circumference_of_a_and_b_intersect
    list = [0.0, 0.0, 5.0, 1.0, 1.0, 5.0]
    assert_equal 1, @circle.compare(list)
  end

  def test_not_overlap
    list = [0.0, 0.0, 2.0, 4.1, 0.0, 2.0]
    assert_equal 0, @circle.compare(list)
  end
end
