STDIN.read.chomp.split("\n").each { |l| puts l.chomp.split(' ').map(&:to_i).inject(:+).to_s.length }
