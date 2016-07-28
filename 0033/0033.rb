# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0033
require 'minitest/autorun'

def foo
  gets.to_i.times do
    min, max = 0, 0
    list = gets.split.map(&:to_i)
    while true
      break if list.empty?
      j = list[0]
      if max < j
        max = j
      elsif min < j
        min = j
      else
        break
      end
      list.shift
    end

    puts list.empty? ? 'YES' : 'NO'
  end
end

foo

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
