require 'bigdecimal'
input = STDIN.read.split("\n")
result = Array.new(input.shift.to_i) do
  x1, y1, x2, y2, x3, y3, x4, y4 = input.shift.chomp.split.map { |e| BigDecimal.new(e) }
  (y1 == y2 && y3 == y4) || (y2 - y1) / (x2 - x1) == (y4 - y3) / (x4 - x3) ? 'YES' : 'NO'
end
puts result
