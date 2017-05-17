require 'journey'

describe Journey do
	subject(:journey){ described_class.new("entry point","exit point")}
	let(:oystercard) {double("oystercard", touch_in: "entry station", touch_out: "exit station")}
	
	it 'is a type of Journey' do
		expect(journey).to be_a Journey
	end

	it 'has a beginning point ' do
		expect(journey.entry_point).to eq "entry point"
	end

	it 'has a ending point' do
		expect(journey.exit_point).to eq "exit point"
	end

	describe '#journey' do

	  it 'stores a journey to list_of_journeys' do
	    oystercard.touch_in("entry_station")
	    oystercard.touch_out("exit_station")
	    expect(journey.show_last_trip).to be journey
	  end
	end
end