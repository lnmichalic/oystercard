require 'journey'

describe Journey do
	subject(:journey){ described_class.new("entry point","exit point")}
	
	it 'is a type of Journey' do
		expect(journey).to be_a Journey
	end

	it 'has a beginning point ' do
		expect(journey.entry_point).to eq "entry point"
	end

	it 'has a ending point' do
		expect(journey.exit_point).to eq "exit point"
	end

end