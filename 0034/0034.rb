# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0034
require 'minitest/autorun'

def foo
  while input = gets
    inputs = input.split(',').map(&:to_i)
    sections = inputs[0..9]
    v1, v2 = inputs[10..11]
    time = sections.inject(:+).to_f / (v1 + v2)
    vkm = time * v1
    sections.each.with_index do |e, i|
      vkm -= e
      if vkm <= 0
        puts i + 1
        break
      end
    end
  end
end

# foo

class Test < Minitest::Test
  def test_railway
    assert_output("4\n7\n6\n") do
      simulate_stdin("1,1,1,1,1,1,1,1,1,1,40,60\n1,1,1,1,1,3,3,3,3,3,50,50\n10,10,10,10,10,10,10,10,10,10,50,49") { foo }
    end
  end

  private

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
