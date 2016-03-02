require_relative 'bike'

class DockingStation
    DEFAULT_CAPACITY=20

    attr_reader :capacity
    attr_reader :bike_count


    def initialize(capacity=DEFAULT_CAPACITY)
     @bike_count = [Bike.new]
     @capacity = capacity
   end

   def count
     @bike_count.count
   end

   def release_bike
     if empty? then raise("No more bikes.")
     elsif (@bike_count.all?{|bike| bike.working? == false } ) then raise("No more working bikes.")
     else
       @bike_count.pop
      #  @bike = bike
     end
   end

   def dock(bike)   # setter method
   	 if full? then raise("Bike dock is full.")
    #  elsif bike.working? == false
    #     @capacity -= 1
    #     @bike_count << bike
    #     @bike = bike
     else
        @bike_count << bike
        @bike = bike
 	   end
   end

   attr_reader :bike # getter method

private
  def full?
    if @bike_count.count >= @capacity
      true
    end
  end

    def empty?
      if @bike_count.count <= 0
        true
      end
    end
end
