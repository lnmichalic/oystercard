class Journey

	MINIMUM_FARE = 1
	PENALTY_FARE = 6

	attr_reader :entry_point, :exit_point

	def initialize(entry_point)
		@entry_point = entry_point
		@exit_point
	end

	def show_last_trip
		self
	end

	def fare
		return PENALTY_FARE if @entry_point == nil
		MINIMUM_FARE
	end

	def in_progress?
		!!@entry_point
	end

end
