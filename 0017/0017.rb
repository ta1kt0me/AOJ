STDIN.read.split("\n").each do |line|
  line.tr!('a-z', 'b-za') until line =~ /this|that|the/
  puts line
end
