require 'garage'

describe Garage do

  let(:bike) { double (:bike) }  # implement this later

  # describe "#fix" do
  #   it 'fixes broken bikes' do
  #     bad_bike = Bike.new
  #     bad_bike.working = false
  #     broken_bikes = [bad_bike]
  #
  #     expect(subject.fix(broken_bikes)[0].working).to eq true
  #   end
  # end

  
  describe "#service_shipment" do
    it { is_expected.to respond_to :service_shipment }
  end


end
