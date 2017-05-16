class Oystercard
  
  attr_reader :balance, :station
  

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
  	fail "Balance too low : Top up Please" if @balance < MINIMUM_BALANCE
  	@station = station
    @in_journey = true
  end

  def in_journey?
  	!!station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end


# oystercard = Oystercard.new
# p oystercard.top_up 90
# p oystercard.touch_in "Fulham"
# p oystercard.station
# p oystercard.touch_out

# p oystercard.balance
# p oystercard.station

# p oystercard.touch_in station
# p oystercard.station

# p oystercard.station


