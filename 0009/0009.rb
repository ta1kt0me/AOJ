require 'benchmark/ips'

Benchmark.ips do |x|
  def calc
    max = 199_999
    res = (5..max).to_a.delete_if(&:even?).each_with_object([2, 3]) do |e, a|
      limit = Math.sqrt(e).round
      lst = a.take_while { |i| i < limit }
      a.push e unless lst.any? { |i| e % i == 0 }
    end
    res.count
  end

  def eratostenes
    max = 199_999
    lst = (2..max).to_a
    result = []
    sqrt = Math.sqrt(max)

    loop do
      elem = lst.shift
      result << elem
      break if elem >= sqrt
      lst.delete_if { |i| i % elem == 0 }
    end

    (result + lst).count
  end

  # def eratostenes_2
  #   max = 199_999
  #   table = Array.new(max + 1, true)
  #   prime_list = []
  #   (2..max).each do |num|
  #     prime_list << num if table[num] == true
  #     k = num * num
  #     while k <= max
  #       table[k] = false
  #       k += num
  #     end
  #   end
  #
  #   prime_list.count
  # end
  #
  def prime
    require 'prime'
    max = 199_999
    Prime.each(max).count
  end

  x.config(time: 10, warmup: 2)
  x.report('calc') { calc }
  x.report('eratostenes') { eratostenes }
  # x.report('eratostenes_2') { eratostenes_2 }
  x.report('prime') { prime }
  x.compare!
end

require 'prime'
STDIN.read.split("\n").map { |i| i.chomp.to_i }.each do |max|
  puts Prime.each(max).count
end
