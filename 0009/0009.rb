# require 'benchmark'
# result = Benchmark.realtime do
STDIN.read.split("\n").map { |i| i.chomp.to_i }.each do |max|
  # max = 199_999
  res = (5..max).to_a.delete_if(&:even?).each_with_object([2, 3]) do |e, a|
    limit = Math.sqrt(e).round
    lst = a.take_while { |i| i < limit }
    unless lst.any? { |i| e % i == 0 }
      a.push e
    end
  end
  puts res.count
end
# end
# puts result
