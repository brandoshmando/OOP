class Rover
	#Creates getter/setter methods for x and y + getter for d
	attr_accessor :x, :y
	attr_reader :d
#Sets cardinal to all of the points on a cardinal compass
	@cardinal = %w[N E S W]
#Sets initial coordinates and direction
	def initialize(str)
		@x = str[0]
		@y = str[2]
		@d = str[4]
	end
#Enables L, R, or M commands to be executed
	def execute_commands(commands)
		commands.each_char do |com|
			if com == "L" || com == "R"
				change_cardinal(com)
			elsif com == "M"
				move
			else
				puts "Error: Unknown command."
			end
		end
		self
	end
#Changes the direction of the "Rover"
	def change_cardinal(rotate)
		@d += @cardinal[@cardinal.index(@d) + "R" ? 1 : -1] 
	end
#Returns value of direction based on what d is currently
	def compass
		@cardinal[@cardinal.index(d)]
	end
#Tells the rover which direction to move based on direction it is facing
	def move
		case compass
		when "N" then y += 1
		when "E" then x += 1
		when "S" then y -= 1
		when "W" then x -=1
		end
	end
end

rover1 = Rover.new('1 2 N')

