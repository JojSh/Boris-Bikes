require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  describe "#new" do
    it "Should set the default change the default value when provided as an argument" do
      station = DockingStation.new(25)
      expect(station.capacity).to eq(25)
    end
  end

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it 'shows bike if a bike is docked' do
    station = subject
    station.dock_bike(Bike.new)
    expect(subject.bikes).not_to be_nil
  end

  describe '#bikes' do
    it 'returns an array' do
      expect(subject.bikes).to be_a(Array)
    end
  end

  describe "#dock_bike" do
    it 'raises an error when the docking station is full' do
      subject.capacity.times { subject.dock_bike(Bike.new) }
      expect { subject.dock_bike(Bike.new)}.to raise_error("The docking station is full.")
    end
  end

  describe '#release_bike' do
      it 'does not release a bike when there are no bikes available' do
        expect { subject.release_bike }.to raise_error("There are no bikes.")
      end

      it 'docks a bike and releases it' do
          subject.dock_bike(Bike.new)
          expect(subject.release_bike).to be_a(Bike)
      end
  end

end
