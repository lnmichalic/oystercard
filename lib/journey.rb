class Journey
	attr_reader :entry_point, :exit_point

	def initialize(entry_point, exit_point)
		@entry_point = entry_point
		@exit_point = exit_point
	end

	def show_last_trip
		self
	end
end