require 'docking_station'

describe DockingStation do

  let(:bike) { double (:bike) }
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

  describe "#remaining_spaces" do
    it 'tells us how many spaces are left' do
      subject.dock(bike)
      expect(subject.remaining_spaces).to eq(subject.capacity-1)
    end
  end



  describe '#dock' do
    it 'raises an error when the docking station is full' do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error('The docking station is full.')
    end
  end

  describe "#unload_to" do
    # it 'unloads broken bikes from the docking station' do
    #   bike = double(:bike, working: false)
    #   van = double(:van, spaces_left: 5, capacity: 15)
    #   5.times { subject.dock(bike) }
    #   expect(subject.unload_to(van)).to eq([bike, bike, bike, bike, bike])
    # end

    it 'unloads only the amount the vehicle can carry' do
      van = double(:van, spaces_left: 5, capacity: 15)
      bike = double(:bike, working: false)
      6.times { subject.dock(bike) }
      subject.unload_to(van)
      expect(subject.bikes.size).to eq(1)
    end
  end


  describe '#release_bike' do
    it 'does not release a bike when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('There are no bikes.')
    end

    it 'does not release broken bike' do
      # allow(bike).to receive(:working).and_return(false)
      bike = double(:bike, working: false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('There are no working bikes.')
    end

    it 'Releases a working bike when there are both broken and working bikes.' do
      bike = double(:bike, working: true)
      3.times { subject.dock bike }
      broken_bike = double(:bike,:working => false)
      subject.dock(broken_bike)
      expect(subject.release_bike.working).to eq(true)
    end

    it 'Releases working bikes' do
      bike = double(:bike, working: true)
      subject.dock(bike)
      expect(subject.release_bike.working).to eq(true)
    end
  end
end
