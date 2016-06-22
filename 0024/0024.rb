STDIN.read.split("\n").map(&:to_f).each do |i|
  t = i / 9.8
  y = 4.9 * t**2
  n = (y + 5) / 5
  puts n.ceil
end
