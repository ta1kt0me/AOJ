# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0035
require 'minitest/autorun'

def foo
  while input = gets
    x1, y1, x2, y2, x3, y3, x4, y4 = input.split(',').map(&:to_f)
    v31 = [x3 - x1, y3 - y1]
    v21 = [x2 - x1, y2 - y1]
    cp1 = v31[0] * v21[1] - v31[1] * v21[0]

    v42 = [x4 - x2, y4 - y2]
    v32 = [x3 - x2, y3 - y2]
    cp2 = v42[0] * v32[1] - v42[1] * v32[0]

    v13 = [x1 - x3, y1 - y3]
    v43 = [x4 - x3, y4 - y3]
    cp3 = v13[0] * v43[1] - v13[1] * v43[0]

    v24 = [x2 - x4, y2 - y4]
    v14 = [x1 - x4, y1 - y4]
    cp4 = v24[0] * v14[1] - v24[1] * v14[0]

    cps = [cp1, cp2, cp3, cp4]
    puts(cps.all? { |i| i < 0 } || cps.all? { |i| i > 0 } ? 'YES' : 'NO')
  end
end

# foo

class Test < Minitest::Test
  def test_convex
    assert_output("YES\nNO\n") do
      simulate_stdin("0.0,0.0,1.0,0.0,1.0,1.0,0.0,1.0\n0.0,0.0,3.0,0.0,1.0,1.0,1.0,3.0\n") { foo }
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
