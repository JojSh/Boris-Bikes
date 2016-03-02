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

  it 'can release working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
