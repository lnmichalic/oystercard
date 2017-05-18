require_relative 'journey'

class Oystercard
  attr_reader :balance, :list_of_journeys, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @list_of_journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
  	fail "Balance too low : Top up Please" if @balance < MINIMUM_BALANCE
    start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.update_exit_point(exit_station)
    deduct(@journey.fare)
    save_journey_to_list
    @journey = Journey.new
  end

  def save_journey_to_list
    @list_of_journeys << @journey
  end

  private

  def start_journey(entry_station)
    if @journey.entry_point
      deduct(@journey.fare)
      save_journey_to_list
    end
    @journey = Journey.new(entry_station, nil)
  end

  def deduct(amount)
    @balance -= amount
  end

end

# card = Oystercard.new
# card.top_up(20)
# card.touch_in('Aldgate')
# p card.touch_out('Westminister')
# p card.show_last_journey
