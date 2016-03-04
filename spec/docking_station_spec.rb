require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }
  # new_docking_station = DockingStation.new
  it 'responds to a command to release a bike' do
    expect(subject).to respond_to(:release_bike)
  end


  it 'can receive bikes' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

	it 'can dock a bike' do
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

  it 'can release working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'allows a user to report a bike as broken'do
    allow(bike).to receive(:report_broken) #.and_set(bike.working == false)
    allow(bike).to receive(:working?).and_return(false)

  	bike.report_broken
    expect(bike.working?).to eq false
  end

  it 'will refuse to release a broken bike' do
    subject.bike_count.last.report_broken                                        #TODO needs to be looked at? > What if
    expect{subject.release_bike}.to raise_error("No more working bikes.")        # more broken bikes are present?
  end



	it 'can show amount of bikes in docking station' do
		expect(subject.count).to eq 1
	end

	it 'expects an error when no more bikes are left' do
		subject.release_bike
		expect{subject.release_bike}.to raise_error("No more bikes.")
  end

		it 'number of bikes increases when a bike is docked' do
			# bike = double(:bike)
      expect(subject.count).to eq 1
			subject.dock(bike)
			expect(subject.count).to eq 2
	  end

		it 'expects an error when bike dock is full' do
		  # bike = double(:bike)
		  (DockingStation::DEFAULT_CAPACITY-1).times do subject.dock(bike) end
		  expect{subject.dock(bike)}.to raise_error(RuntimeError, "Bike dock is full.")
	  end

	  it 'set default capacity' do
	  expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end
end
