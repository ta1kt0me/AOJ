STDIN.read.split("\n").map { |i| i.chomp.to_i }.each do |max|
  puts (2..max).to_a.each_with_object([]) { |e, a| a << e if a.none? { |i| e == 2 || e % i == 0 } }.count
end
