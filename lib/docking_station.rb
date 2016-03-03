require_relative 'Bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise "There are no bikes."
    end
    if working_bikes.empty?
      fail 'There are no working bikes.'
    end
    working_bikes.pop
  end

  def broken_bike(bike)
    bike.broken == true
    dock_bike(bike)
  end

  def dock(bike)
    fail "The docking station is full." if full?
    @bikes << bike
  end

  private

  def working_bikes
    @bikes.select{ |bike| bike.broken == false }
  end

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
