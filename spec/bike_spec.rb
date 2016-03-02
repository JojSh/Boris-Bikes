require "Bike"

describe Bike do
  it "responds to working? method" do
    expect(subject).to respond_to :working?
  end

  it "responds to broken? method" do
    expect(subject).to respond_to :broken
  end
end
