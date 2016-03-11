# GCD, LCM
# LCM = a * b / GCD

require 'byebug'

def get_gcd(elems)
  a = elems[-2]
  b = elems[-1]
  rest = a % b

  return b if rest.zero?
  return b if rest == b

  get_gcd([b, rest])
end

STDIN.read.chomp.split("\n").each do |list|
  elems = list.split.map(&:to_i).sort_by {|i| -i }
  gcd = get_gcd elems
  lcm = elems.inject(:*) / gcd

  puts "#{gcd} #{lcm}"
end
