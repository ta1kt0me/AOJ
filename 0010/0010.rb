def center(x1, y1, x2, y2, x3, y3)
  a1 = 2 * (x2 - x1)
  b1 = 2 * (y2 - y1)
  c1 = x1**2 - x2**2 + y1**2 - y2**2
  a2 = 2 * (x3 - x1)
  b2 = 2 * (y3 - y1)
  c2 = x1**2 - x3**2 + y1**2 - y3**2
  x = (b1 * c2 - b2 * c1) / (a1 * b2 - a2 * b1)
  y = (c1 * a2 - c2 * a1) / (a1 * b2 - a2 * b1)
  [x, y]
end

STDIN.gets.chomp.to_i.times do
  STDIN.read.split("\n").each do |data|
    x1, y1, x2, y2, x3, y3 = data.split.map { |i| i.chomp.to_f }
    x, y = center x1, y1, x2, y2, x3, y3
    r = Math.sqrt((x1 - x)**2 + (y1 - y)**2)

    puts format('%.3f %.3f %.3f', x, y, r)
  end
end
