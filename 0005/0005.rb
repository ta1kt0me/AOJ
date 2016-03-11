# GCD, LCM
# LCM = a * b / GCD
def get_gcd(a, b)
  rest = a % b
  return b if rest.zero? || rest == b
  get_gcd b, rest
end

STDIN.read.chomp.split("\n").each do |list|
  elems = list.split.map(&:to_i).sort_by(&:-@)
  gcd = get_gcd(*elems)
  lcm = elems.inject(:*) / gcd

  puts "#{gcd} #{lcm}"
end
