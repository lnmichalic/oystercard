require 'journey'

describe Journey do
  subject(:journey){ described_class.new("entry point")}
  let(:oystercard) {double("oystercard", touch_in: "entry station", touch_out: "exit station")}
  let(:oystercard2) {double("oystercard", touch_in: nil, touch_out: nil)}
  let(:journey_with_no_touch_in) { described_class.new(nil) }

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
      expect(journey.fare).to eq described_class::MINIMUM_FARE
    end

    it "charges the penalty fare if a passenger doesn't touch in" do
      # oystercard2.touch_in(nil)
      p @entry_point
      # oystercard2.touch_out('Aldgate')
      p @entry_point
      p journey_with_no_touch_in.entry_point
      expect(journey_with_no_touch_in.fare).to eq described_class::PENALTY_FARE
    end
  end

  describe '#in_progress?' do
    it 'returns true when journey is in progress' do
      oystercard.touch_in("entry_station")
      expect(journey).to be_in_progress
    end
  end

end
