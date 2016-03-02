require 'bike.rb'

describe Bike do
  # new_bike = Bike.new
  it { is_expected.to respond_to :working?}
  # it 'responds with the bike\'s working condition' do
  #   expect(subject).to respond_to(:working?)
  # end
end
