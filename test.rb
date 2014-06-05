class Rover
	def initialize(x, y, bearing)
		@x = x
		@y = y
		@bearing = bearing
	end
	
	def execute_commands(commands)
		commands.each_char do |command|
			if command == "L"
				change_direction(command)
			elsif command == "R"
				change_direction(command)
			elsif command == "M"
				move
			else
				puts "ERROR"
			end
		end
		self
	end

	def change_direction(rotate)
		bearings = ["N", "E", "S", "W"] 
	end

