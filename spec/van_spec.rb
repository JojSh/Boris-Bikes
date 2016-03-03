require 'van'

describe Van do
  let(:bike) { double :bike }
  describe "#load" do

    it 'can collect a number of items' do
      expect(subject.load([bike,bike,bike,bike,bike])).not_to be_empty
    end

    it 'cannot collect more than its capacity' do
      (subject.capacity).times { subject.load([bike]) }
      expect { subject.load([bike]) }.to raise_error('The van is full')
    end

  end

  describe "#spaces_left" do
    it 'tells us how spaces it has left' do
      bikes = [bike,bike,bike,bike,bike]
      subject.load(bikes)
      expect(subject.spaces_left).to eq(subject.capacity - bikes.size)
    end
  end

  describe '#new' do
    it 'Should set the default capacity when provided as an argument' do
      van = Van.new(25)
      expect(van.capacity).to eq(25)
    end
  end

  describe "#unload" do

    it 'can unload items' do
      subject.load([1,2,3,4,5])
      subject.unload
      expect(subject.cargo).to eq []
    end
  end

end
