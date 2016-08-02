# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0036
require 'minitest/autorun'

def a?(i, j, lines)
  return false if i > 6 || j > 6
  [lines[i+1][j], lines[i][j+1], lines[i+1][j+1]].all? {|e| e == 1}
end

def b?(i, j, lines)
  return false if i > 4
  [lines[i+1][j], lines[i+2][j], lines[i+3][j]].all? { |e| e == 1 }
end

def c?(i, j, lines)
  return false if j > 4
  [lines[i][j+1], lines[i][j+2], lines[i][j+3]].all? { |e| e == 1 }
end

def d?(i, j, lines)
  return false if j < 1 || i > 5
  [lines[i+1][j-1], lines[i+1][j], lines[i+2][j-1]].all? { |e| e == 1 }
end

def e?(i, j, lines)
  return false if i > 6 || j > 5
  [lines[i][j+1], lines[i+1][j+1], lines[i+1][j+2]].all? { |e| e == 1 }
end

def f?(i, j, lines)
  return false if i > 5 || j > 6
  [lines[i+1][j], lines[i+1][j+1], lines[i+2][j+1]].all? { |e| e == 1 }
end

def g?(i, j, lines)
  return false if j < 1 || j > 6 || i > 6
  [lines[i][j+1], lines[i+1][j-1], lines[i+1][j]].all? { |e| e == 1 }
end

def form?(i, j, lines)
  if a?(i, j, lines)
    'A'
  elsif b?(i, j, lines)
    'B'
  elsif c?(i, j, lines)
    'C'
  elsif d?(i, j, lines)
    'D'
  elsif e?(i, j, lines)
    'E'
  elsif f?(i, j, lines)
    'F'
  elsif g?(i, j, lines)
    'G'
  end
end

def foo
  while true
    lines = []
    while gets
      break if $_ =~ /^\n/
      lines << $_.split('').map(&:to_i)
      break if lines.size == 8
    end

    next if $_ =~ /^\n/
    break if $_.nil?

    form = nil
    lines.each.with_index do |line, i|
      line.each.with_index do |char, j|
        next if char.zero?
        form = form?(i, j, lines)
        break if !form.nil?
      end
      break if !form.nil?
    end
    puts form
  end
end

foo

class Test < Minitest::Test
  def test_io
    # str = "0000000\n00000000\n01100000\n00110000\n00000000\n00000000\n00000000\n00000000\n\n00011110\n00000000\n00000000\n00000000\n00000000\n00000000\n00000000\n00000000\n\n00000000\n00000000\n00110000\n00110000\n00000000\n00000000\n00000000\n00000000\n"
    str = <<-EOS
00000000
00000000
01100000
00110000
00000000
00000000
00000000
00000000

00011110
00000000
00000000
00000000
00000000
00000000
00000000
00000000

00000000
00000000
00110000
00110000
00000000
00000000
00000000
00000000

00000000
00100000
00100000
00100000
00100000
00000000
00000000
00000000

00000000
00001000
00011000
00010000
00000000
00000000
00000000
00000000

00000000
00011000
00110000
00000000
00000000
00000000
00000000
00000000

00000000
00000100
00000110
00000010
00000000
00000000
00000000
00000000
EOS
    assert_output("E\nC\nA\nB\nD\nG\nF\n") do
      simulate_stdin(str) { foo }
    end
  end

  private

  def simulate_stdin(*input)
    io = StringIO.new
    input.each { |i| io.puts(i) }
    io.rewind

    actual_io, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_io
  end
end
