require 'minitest/autorun'
# require 'minitest'

class HitBlow
  def self.check(a, b)
    hits = [a, b].transpose.select { |x, y| x == y }.flatten.uniq
    blows = a & b - hits
    [hits.size, blows.size]
  end
end

STDIN.read.split("\n").each_slice(2) do |a, b|
  result = HitBlow.check(a.split.map(&:to_i), b.split.map(&:to_i))
  printf "%s %s\n", result[0], result[1]
end

class Test < Minitest::Test
  def setup
    @hit_blow = HitBlow
  end

  def test_one_hit_no_blow
    a = [1, 2, 3, 4]
    b = [5, 6, 7, 4]

    assert_equal([1, 0], @hit_blow.check(a, b))
  end

  def test_no_hit_one_blow
    a = [1, 2, 3, 4]
    b = [5, 6, 1, 7]

    assert_equal([0, 1], @hit_blow.check(a, b))
  end

  def test_one_hit_one_blow
    a = [1, 2, 3, 4]
    b = [5, 2, 1, 7]

    assert_equal([1, 1], @hit_blow.check(a, b))
  end

  def test_all_hit
    a = [1, 2, 3, 4]
    b = [1, 2, 3, 4]

    assert_equal([4, 0], @hit_blow.check(a, b))
  end

  def test_all_blow
    a = [1, 2, 3, 4]
    b = [4, 3 ,2, 1]

    assert_equal([0, 4], @hit_blow.check(a, b))
  end
end
