require_relative 'bike'

class DockingStation
   def initialize
     @bike_count = 5
   end

   def count
     @bike_count
   end

   def release_bike
     if @bike_count < 1 then raise("No more bikes.")
     else
       @bike_count -= 1
       Bike.new
     end
   end

   def dock(bike)   # setter method
     @bike = bike
   end

   attr_reader :bike  # getter method
end
