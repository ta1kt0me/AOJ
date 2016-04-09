gets.chomp.to_i.times do
  sum = Array.new(2) { gets.chomp.to_i }.inject(:+)
  puts(sum >= 10**80 ? 'overflow' : sum)
end
