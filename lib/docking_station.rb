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
    bike.working == false
    dock_bike(bike)
  end

  def dock(bike)
    fail "The docking station is full." if full?
    @bikes << bike
  end

  def remaining_spaces
    @capacity - @bikes.length
  end

  def unload_to(vehicle)
    broken_bikes_to_load = bikes_to_load(vehicle.spaces_left)
    broken_bikes_to_load
  end

  private

  def working_bikes
    @bikes.select{ |bike| bike.working == true }
  end

  def bikes_to_load(number)
    bikes_taken = 0
    broken_bikes_to_load = @bikes.select{ |bike| bike.working == false }
    @bikes.reject! do |bike|
        if !bike.working && bikes_taken < number
          bikes_taken += 1
          true
        else
          false
        end
    end
    broken_bikes_to_load
  end

  def broken_bikes
    @bikes.select{ |bike| bike.working == false }
  end

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end

# unload_to (van)

# load_from (van)
