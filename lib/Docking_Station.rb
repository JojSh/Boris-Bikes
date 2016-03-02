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
   	if @bike_count > 9 then raise("Bike dock is full.") 
   else
     @bike_count +=1
     @bike = bike
 	end
   end

   attr_reader :bike  # getter method
end
