require 'minitest/autorun'

def foo
  i = gets.to_i
  i.times do
    left = []
    right = []
    list = gets.split.map(&:to_i)
    list.each do |j|
      if left.empty? || j > left.last
        left << j
      elsif right.empty? || j > right.last
        right << j
      end
    end

    res = list.length == (right.length + left.length) ? 'YES' : 'NO'
    puts res
  end
end

# foo
class Test < Minitest::Test
  def test_sample
    assert_output("YES\nNO\n") do
      simulate_stdin("2\n3 1 4 2 5 6 7 8 9 10\n10 9 8 7 6 5 4 3 2 1\n") { foo }
    end
  end

  def simulate_stdin(*input)
    io = StringIO.new
    input.flatten.each { |i| io.puts(i) }
    io.rewind

    actual_stdin, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_stdin
  end
end
