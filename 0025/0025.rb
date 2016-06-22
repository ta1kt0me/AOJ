require 'minitest/autorun'
# require 'minitest'

class HitBlow
  def check(a, b)
    hit_target = [a, b].transpose
    hit_target.delete_if { |x, y| x == y }
    hit_count = 4 - hit_target.count
    return [hit_count, 0] if hit_count == 4
    blow_target = hit_target.transpose
    blow_count = 4 - hit_count - (blow_target[0] - blow_target[1]).count
    [hit_count, blow_count]
  end
end

# inputs = STDIN.read.split("\n")
#
# loop do
#   break if inputs.empty?
#   a = inputs.shift.split.map(&:to_i)
#   b = inputs.shift.split.map(&:to_i)
#   result = HitBlow.new.check(a, b)
#   printf "%s %s\n", result[0], result[1]
# end

class Test < Minitest::Test
  def setup
    @hit_blow = HitBlow.new
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
