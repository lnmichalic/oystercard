require 'oystercard'

describe Oystercard do
	subject(:oystercard) { described_class.new }

	it { is_expected.to respond_to(:top_up).with(1).argument }
	it { is_expected.to respond_to(:deduct).with(1).argument }
	it { is_expected.to respond_to(:in_journey?) }
	it { is_expected.to respond_to(:touch_in) }
	it { is_expected.to respond_to(:touch_out) }

	it "instance has default value of 0" do
		expect(oystercard.balance).to eq(0)
	end

describe '#top_up' do
	it "can top up the balance" do
		expect{ oystercard.top_up 1}.to change{oystercard.balance}.by 1
	end
end

	it 'raises an error if the maximum balance is exceeded' do
  	maximum_balance = Oystercard::MAXIMUM_BALANCE
  	oystercard.top_up maximum_balance
  	expect{ oystercard.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
	end

describe '#deduct' do
	it 'can deduct from balance' do
	expect{ oystercard.deduct 1}.to change{oystercard.balance}.by -1
	end
end

describe '#in_journey?' do
	it 'returns false when oystercard initialized' do
		expect(oystercard.in_journey?).to eq false
	end
	it 'returns true when oystercard is touched in' do
		oystercard.touch_in
		expect(oystercard.in_journey?).to eq true
	end
	it 'returns false when oystercard is touched out' do
		oystercard.touch_in
		oystercard.touch_out
		expect(oystercard.in_journey?).to eq false
	end
end

describe '#touch_in' do
	it 'returns true' do
		expect(oystercard.touch_in).to eq true
	end
end

describe '#touch_out' do
	it 'returns false' do
		expect(oystercard.touch_out).to eq false
	end
end

end
