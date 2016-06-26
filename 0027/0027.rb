# require 'minitest/autorun'
require 'minitest'
require 'date'

class Whatday
  def self.date(m, d)
    Date::DAYNAMES[Date.new(2004, m, d).wday]
  end
end

STDIN.read.split("\n").each do |line|
  m, d = line.split.map(&:to_i)
  break if m.zero?
  puts Whatday.date(m, d)
end

class WhatdayTest < Minitest::Test
  def test_mon
    assert_equal('Monday', Whatday.date(1, 5))
  end

  def test_tue
    assert_equal('Tuesday', Whatday.date(1, 6))
  end

  def test_wed
    assert_equal('Wednesday', Whatday.date(1, 7))
  end

  def test_thu
    assert_equal('Thursday', Whatday.date(1, 1))
  end

  def test_fri
    assert_equal('Friday', Whatday.date(1, 2))
  end

  def test_sat
    assert_equal('Saturday', Whatday.date(1, 3))
  end

  def test_sun
    assert_equal('Sunday', Whatday.date(1, 4))
  end

  def test_leap_year
    assert_equal('Sunday', Whatday.date(2, 29))
  end
end
