# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0031
require 'minitest/autorun'

def weight
  master = Array.new(10) { |i| 2**i }.reverse
  while gets
    element = $_.to_i
    puts master.select { |i| i <= element }.each_with_object([]) { |i, tmp|
      (element -= i) && (tmp << i) if i <= element
    }.sort.join(' ')
  end
end

# weight

class Test < Minitest::Test
  def test_5
    assert_output "1 4\n1 2 4\n1 2 4 8 16 32 64\n" do
      simulate_stdin("5\n7\n127") { weight }
    end
  end

  def simulate_stdin(*inputs)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind
    actual_stdin, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_stdin
  end
end
