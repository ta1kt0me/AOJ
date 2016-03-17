# require 'benchmark/ips'
#
# Benchmark.ips do |x|
#   def origin
#     max = 199_999
#     res = (5..max).to_a.delete_if(&:even?).each_with_object([2, 3]) do |e, a|
#       limit = Math.sqrt(e).round
#       lst = a.take_while { |i| i < limit }
#       unless lst.any? { |i| e % i == 0 }
#         a.push e
#       end
#     end
#     # puts res.count
#   end
#
#   def eratostenes
#     max = 199_999
#     lst = (2..max).select(&:odd?)
#     result = []
#     sqrt = Math.sqrt(max)
#
#     loop do
#       elem = lst.shift
#       result << elem
#       break if elem >= sqrt
#       lst.delete_if { |i| i % elem == 0 }
#     end
#
#     puts (result + lst).count
#   end
#
#   def prime
#     require 'prime'
#     max = 199_999
#     puts Prime.each(max).count
#   end
#
#   x.config(time: 10, warmup: 2)
#   x.report('origin') { origin }
#   x.report('eratostenes') { eratostenes }
#   x.report('prime') { prime }
#   x.compare!
# end

STDIN.read.split("\n").map { |i| i.chomp.to_i }.each do |max|
  lst = (3..max).select(&:odd?)
  result = []
  sqrt = Math.sqrt(max)

  loop do
    elem = lst.shift
    result << elem
    break if elem >= sqrt
    lst.delete_if { |i| i % elem == 0 }
  end

  puts (result + lst).unshift(2).count
end
