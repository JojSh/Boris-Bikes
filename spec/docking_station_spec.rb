require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }

  it { is_expected.to respond_to(:return_bike).with(1).argument }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'shows bike if a bike is docked' do
    station = subject
    bike = station.release_bike
    station.return_bike(bike)
    expect(subject.docked_bike).not_to be_nil
  end
end
