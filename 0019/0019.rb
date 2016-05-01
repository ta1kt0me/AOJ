puts STDIN.gets.chomp.to_i.downto(2).inject(1) { |a, e| a * e }
