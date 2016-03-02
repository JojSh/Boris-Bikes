require 'docking_station'

describe DockingStation do
  # new_docking_station = DockingStation.new
  it 'responds to a command to release a bike' do
    expect(subject).to respond_to(:release_bike)
  end

  # or #=> it { is_expected.to respond_to :release_bike }

  it 'can receive bikes' do
    expect(subject).to respond_to(:dock).with(1).argument
    # expect(subject).to respond_to(:dock_bike)
  end

	it 'can dock a bike' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
		# expect(bike.dock).to eq true
	end

  it 'can release working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

	it 'can show amount of bikes in docking station' do
		expect(subject.count).to eq 5
	end

	it 'expects an error when no more bikes are left' do
		5.times do subject.release_bike end
		expect{subject.release_bike}.to raise_error("No more bikes.")

end
		it 'number of bikes increases when a bike is docked' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.count).to eq 6
	end

		it 'expects an error when bike dock is full' do
			bike = Bike.new
		6.times do subject.dock(bike) end
		expect{subject.dock(bike)}.to raise_error(RuntimeError, "Bike dock is full.")

	end

end
