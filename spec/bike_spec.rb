require "Bike"

describe Bike do
  it "responds to working method" do
    expect(subject).to respond_to :working
  end

  it "responds to report_broken method" do
    expect(subject).to respond_to :report_broken
  end
end
