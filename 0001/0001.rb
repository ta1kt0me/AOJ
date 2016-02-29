require 'minitest/autorun'

class HillTest < Minitest::Test
  def setup
    @hill = Hill.new(input)
  end

  def test_sort
    result = @hill.sort
    assert_equal result[0], 3776
    assert_equal result[1], 2848
    assert_equal result[2], 2840
  end

  def test_output
    result =<<-"EOS"
3776
2848
2840
    EOS
    assert_output(result) { @hill.output }
  end

  private

  def input
    a = <<-"EOS"
1819
2003
876
2840
1723
1673
3776
2848
1592
922
    EOS
    a
  end
end

class Hill
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def sort
    @input.split("\n").map(&:to_i).select { |i| i >= 0 && i <= 10_000 }.sort { |x, y| y <=> x }
  end

  def output
    sort[0..2].each { |i| puts i }
  end
end

a=[];(s=gets.to_i).between?(0,10000)?a<<s:next while a.length<11;a.sort_by{|v|-v}[0..2].each {|i|puts i}
10.times.each_with_object([]) { |_, a| a << gets.to_i }.sort { |a, b| b <=> a }[0..2].each { |i| puts i }
