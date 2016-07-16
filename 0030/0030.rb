# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0030
require 'minitest/autorun'

def count(limit, max, n, queue)
  return queue.inject(:+) == max ? 1 : 0 if queue.size == limit

  (n..9).step.inject(0) do |result, i|
    result += count(limit, max, i + 1, queue << i)
    queue.pop
    result
  end
end

def bfs
  while gets
    limit, max = $_.split.map(&:to_i)
    break if limit == 0 && max == 0
    puts count(limit, max, 0, [])
  end
end

# bfs

class FooTest < Minitest::Test
  def test_3_6
    assert_output "3\n" do
      simulate_stdin("3 6\n") { bfs }
    end
  end

  def test_3_1
    assert_output "0\n" do
      simulate_stdin("3 1\n") { bfs }
    end
  end

  def test_0_0
    assert_output '' do
      simulate_stdin("0 0\n") { bfs }
    end
  end

  private

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
