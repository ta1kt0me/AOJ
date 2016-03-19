line_count = STDIN.gets.chomp.to_i
points = Array.new(STDIN.gets.chomp.to_i) { STDIN.gets.split(',').map { |i| i.chomp.to_i } }
puts (1..line_count).map { |i|
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
}.sort_by { |x| x[0] }.map { |e| e[1] }
