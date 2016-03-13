# 5% loan shark
# n weeks debt from 100,000 yen
puts STDIN.gets.chomp.to_i.times.inject(100_000) { |a, _e| (a * 1.05 / 1_000).ceil * 1_000 }
