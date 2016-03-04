require_relative 'bike'

class DockingStation
    DEFAULT_CAPACITY=20

    attr_reader :capacity, :bike_count, :bike

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
     end
   end

   def dock(bike)
   	 if full? then raise("Bike dock is full.")
     else
        @bike_count << bike
        @bike = bike
 	   end
   end


  def broken_bikes
    broken_ary = @bike_count.select { |bike| bike.working? == false }
    @bike_count.reject! {|bike| bike.working? == false }
    broken_ary
  end




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
