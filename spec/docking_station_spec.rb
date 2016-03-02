require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it 'shows bike if a bike is docked' do
    station = subject
    station.dock_bike(Bike.new)
    expect(subject.bike).not_to be_nil
  end

  describe "#dock_bike" do
    it 'raises an error when the docking station is full' do
      subject.dock_bike(Bike.new)
      expect { subject.dock_bike(Bike.new)}.to raise_error("The docking station is full.")
    end
  end

  describe '#release_bike' do
      it 'does not release a bike when there are no bikes available' do
        expect { subject.release_bike }.to raise_error("There are no bikes.")
      end

      it 'docks a bike and releases it' do
          subject.dock_bike(Bike.new)
          expect(subject.bike).to be_a(Bike)
      end
  end

end
