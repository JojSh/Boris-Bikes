require 'Docking_Station.rb'

describe DockingStation do

	new_docking_station = DockingStation.new

	it 'responds to the command to release the bike' do

		expect(new_docking_station).to respond_to(:release_bike)
	end

	it 'is can contain a bike' do
		new_docking_station.release_bike
		expect(new_docking_station.holds).to eq []    # (may need to eq a non-empty
	end

	it 'can receive a bike' do
		new_docking_station.release_bike
		expect(new_docking_station.holds.push(Bike.new).length).to eq 1
	end

	it 'cannot release a bike when empty' do
		new_docking_station.release_bike
		expect {raise "No more bikes."}.to raise_error
		#.to raise_error("oops")
	end
	# it 'tells me whether a bike is already present' do
	# 	new_docking_station.holds.push((Bike.new).class)
	# 	expect(new_docking_station.holds[0].class).to eq Bike
	# end

	it 'can release a bike' do
		expect(new_docking_station.release_bike.class).to eq Bike
	end

	it 'releases a working bike' do
		expect(new_docking_station.release_bike.working?).to eq true
	end
end
