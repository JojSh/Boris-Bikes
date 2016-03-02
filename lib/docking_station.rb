# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      raise "There are no bikes."
    end
    @bikes.pop
  end

  def dock_bike(bike)
    fail "The docking station is full." if @bikes.length >= 20
    @bikes << bike
  end
end
