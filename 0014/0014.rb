STDIN.read.split("\n").map { |e| e.chomp.to_i }.each do |n|
  puts((0..(600 - n)).step(n).map { |i| n * i**2 }.inject(:+))
end
