puts STDIN.gets.chomp.chars.inject([]) { |a, e| a.unshift(e) }.join
