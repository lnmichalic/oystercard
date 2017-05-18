require 'journey'

describe Journey do
  subject(:journey){ described_class.new("entry point")}
  let(:oystercard) {double("oystercard", touch_in: "entry station", touch_out: "exit station")}
  let(:oystercard2) {double("oystercard", touch_in: nil, touch_out: nil)}
  let(:journey_with_no_touch_in) { described_class.new(nil, 'Aldgate') }

  it 'is a type of Journey' do
  expect(journey).to be_a Journey
  end

  it 'has a beginning point ' do
  expect(journey.entry_point).to eq "entry point"
  end

  # it 'has a ending point' do
  # expect(journey.exit_point).to eq "exit point"
  # end

  describe '#fare' do
    it 'calculates the fare' do
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end

    it "charges the penalty fare if a passenger doesn't touch in" do
      expect(journey_with_no_touch_in.fare).to eq described_class::PENALTY_FARE
    end

    it "charges the minimum fare if the journey is complete" do
      journey.update_exit_point('exit point')
      expect(journey.fare).to eq described_class::MINIMUM_FARE
    end

  end

  describe '#in_progress?' do
    it 'returns true when journey is in progress' do
      oystercard.touch_in("entry_station")
      expect(journey).to be_in_progress
    end

    it 'returns false if the journey is completed' do
      journey.update_exit_point('exit point')
      expect(journey).not_to be_in_progress
    end

  end

end
