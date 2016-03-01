require './lib/Bike.rb'

class DockingStation
	def initialize
		@holds = [Bike.new]
	end

	# def holds
	# 	@holds
	# end

	attr_reader :holds

	def release_bike
		 	@holds.pop
		Bike.new
	end
end
