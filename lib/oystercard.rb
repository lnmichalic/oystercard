class Oystercard
  attr_reader :balance, :in_journey
  alias_method :in_journey?, :in_journey

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

  def deduct(amount)
  	@balance -= amount
  end

  def touch_in
  	fail "Balance too low : Top up Please" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end

# oystercard = Oystercard.new
# # p oystercard.touch_in
# p oystercard.balance
# p oystercard.top_up 10
# p oystercard.touch_in 
# p oystercard.deduct 9
# p oystercard.touch_in
# p oystercard.deduct 1
# p oystercard.touch_in