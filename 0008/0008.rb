result = (0..9).to_a.repeated_permutation(4).map { |a| a.inject(:+) }.each_with_object(Hash.new(0)) { |e, a| a[e] += 1 }
STDIN.read.split("\n").map { |e| e.chomp.to_i }.each { |n| puts result[n] || 0 }
