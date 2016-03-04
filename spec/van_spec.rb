require 'van'

describe Van do

  let(:docking_station) { double :docking_station }

  describe "#collect_broken_bikes" do
    # MAY BE EXTRANEOUS
    # it 'receives nil if there are no broken bikes' do
    #   allow(docking_station).to receive(:broken_bikes).and_return(nil)
    #   expect(subject.collect_broken_bikes(docking_station)).to be nil
    # end
    it 'can receive something (note: nil is something)' do
      allow(docking_station).to receive(:broken_bikes).and_return([1])
      expect(subject).to respond_to(collect_broken_bikes(docking_station)).with(1).argument
    end
    # xit 'receives an array of broken bikes' do
    #   expect(subject.collect_broken_bikes(docking_station)).to
    # end
  end
end
