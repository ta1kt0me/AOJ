line_count = STDIN.gets.chomp.to_i
points = STDIN.gets.chomp.to_i.times.inject([]) do |a, _e|
  a << STDIN.gets.split(',').map { |i| i.chomp.to_i }
end
result = (1..line_count).map do |i|
  position = i
  points.each do |point|
    case position
    when point[0]
      position = point[1]
    when point[1]
      position = point[0]
    end
  end
  [position, i]
end

puts result.sort { |x, y| x[0] <=> y[0] }.map { |e| e[1] }
