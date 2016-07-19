# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0032
require 'minitest/autorun'

def calc
  rectangle = 0
  rhombus = 0
  while gets
    x, y, z = $_.split(',').map(&:to_i)
    rhombus += 1 if x == y
    rectangle += 1 if x ** 2 + y ** 2 == z ** 2
  end
  puts rectangle
  puts rhombus
end

calc

class Test < Minitest::Test
  def test_one_two
    assert_output "1\n2\n" do
      simulate_stdin("3,4,5\n5,5,8\n4,4,4\n5,4,3") { calc }
    end
  end

  private

  def simulate_stdin(*input)
    io = StringIO.new
    input.flatten.each { |str| io.puts(str) }
    io.rewind

    actual_stdin, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_stdin
  end
end
