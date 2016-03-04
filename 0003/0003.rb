inputs = []
STDIN.gets.chomp.to_i.times.map do
  inputs << STDIN.gets.chomp.split.map(&:to_i).sort.reverse.map{|i| i**2}
end

inputs.each do |i|
  result = i[0] == i[1] + i[2] ? 'YES' : 'NO'
  puts result
end
