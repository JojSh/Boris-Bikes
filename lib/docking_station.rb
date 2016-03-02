# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation

  attr_reader :bike

  def release_bike
    if @bike.nil?
      raise "There are no bikes."
    end
    @bike  = nil
  end

  def dock_bike(bike)
    @bike = bike
  end
end
