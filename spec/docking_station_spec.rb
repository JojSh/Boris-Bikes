require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#new' do
    it 'Should set the default capacity when provided as an argument' do
      station = DockingStation.new(25)
      expect(station.capacity).to eq(25)
    end
  end

  it { is_expected.to respond_to(:broken_bike) }

  it 'shows bike if a bike is docked' do
    subject.dock double(:bike)
    expect(subject.bikes).not_to be_nil
  end

  describe '#bikes' do
    it 'returns an array' do
      expect(subject.bikes).to be_a(Array)
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error('The docking station is full.')
    end
  end

  describe '#release_bike' do
    it 'does not release a bike when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('There are no bikes.')
    end

    it 'does not release broken bike' do
      bike = double(:bike)
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('There are no working bikes.')
    end

    it 'Releases a working bike when there are both broken and working bikes.' do
      3.times { subject.dock double(:bike) }
      bike = double(:bike)
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'Releases working bikes' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end
end
