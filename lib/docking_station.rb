# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if empty?
      raise "There are no bikes."
    end
    @bikes.pop
  end

  def dock_bike(bike)
    fail "The docking station is full." if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
