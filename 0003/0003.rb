Array.new(STDIN.gets.chomp.to_i) { STDIN.gets.chomp.split.map(&:to_i).sort.reverse.map { |i| i**2 } }.each do |x, y, z|
  puts x == y + z ? 'YES' : 'NO'
end
