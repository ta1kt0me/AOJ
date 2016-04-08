class RailRoad
  attr_accessor :rail, :exit_train

  def initialize
    @rail = []
    @exit_train = []
  end

  def exit
    @exit_train.push @rail.pop
  end

  def enter(num)
    @rail.push num
  end

  def complete
    @exit_train.each { |e| puts e }
  end
end

rail_road = RailRoad.new
STDIN.read.split("\n").map { |e| e.chomp.to_i }.each do |train|
  train == 0 ? rail_road.exit : rail_road.enter(train)
end
rail_road.complete
