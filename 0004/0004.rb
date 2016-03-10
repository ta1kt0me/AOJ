# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0004
# IN: 1 2 3 4 5 6
# OUT: -1.000 2.000
STDIN.read.chomp.split("\n").each do |list|
  a, b, c, d, e, f = list.split.map(&:to_f)
  x = (b * f - c * e) / (b * d - a * e)
  y = (a * f - c * d) / (a * e - d * b)
  puts [x, y].map { |i| format('%.3f', i.zero? && i.abs || i) }.join(' ')
end
