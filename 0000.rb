# (1..9).each do |i|
a=(1..9).to_a;a.product(a).each { |i, j| puts "#{i}x#{j}=#{i*j}" }
