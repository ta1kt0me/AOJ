x = 0
y = 0
bd = 0

loop do
  step, dir = gets.chomp.split(',').map(&:to_i)

  break if step.zero? && dir.zero?

  rad = bd * Math::PI / 180

  x += step * Math.sin(rad)
  y += step * Math.cos(rad)
  bd += dir
end

puts x.to_i
puts y.to_i
