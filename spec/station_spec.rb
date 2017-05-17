require 'station'

describe Station do
  subject(:station) { described_class.new('name', 'zone') }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :zone }

  it 'station is a type of station' do
    expect(station).to be_a Station
  end

  it 'station has a name' do
    expect(station.name).to eq 'name'
  end

  it 'has a zone' do
    expect(station.zone).to eq 'zone'
  end
end
