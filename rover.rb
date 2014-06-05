class Rover
	#Creates getter/setter methods for x and y + getter for d
	attr_accessor :x, :y
	attr_reader :d

#Sets initial coordinates and direction
	def initialize(str)
		@x = str[0].to_i
		@y = str[2].to_i
		@d = str[4]
		@cardinal = %w[N E S W]
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
	#Makes the output prettier
	def to_s
		"Point: #{x}, #{y} Facing: #{d}"
	end
#Changes the direction of the "Rover"
	def change_cardinal(rotate)
		if rotate == "R"
			@d = @cardinal[(@cardinal.index(@d) + 1) % 4]
		else
			@d = @cardinal[(@cardinal.index(@d) - 1) % 4]
		end
	end
#Returns value of direction based on what d is currently
	def compass
		@cardinal[@cardinal.index(d)]
	end
#Tells the rover which direction to move based on direction it is facing
	def move
		case compass
		when "N" then @y += 1
		when "E" then @x += 1
		when "S" then @y += -1
		when "W" then @x += -1
		end
	end
end

rover1 = Rover.new('1 2 N')
puts rover1.execute_commands('LMLMLMLMM')

rover2 = Rover.new('3 3 E')
puts rover2.execute_commands('MMRMMRMRRM')

