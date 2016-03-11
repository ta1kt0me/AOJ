puts STDIN.gets.chomp.chars.inject([]) { |l, c| l.unshift(c) }.join
