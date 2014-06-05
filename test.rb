class Rover
	attr_accessor :x, :y
	attr_reader :d
	
	def initialize(x, y, d)
		@x = x
		@y = y
		@d = d
	end
	
	def execute_commands(commands)
		commands.each_char do |command|
			if command == "L" || command == "R"
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
		cardinal = ["N", "E", "S", "W"]
		if rotate == "R"
			@d = cardinal[cardinal.index(d) + 1]
		else
			@d = cardinal[cardinal.index(d) - 1]
		end
	end

	def move
		# if @x > @@x || @x < 0
		# 	puts "Error: Rover cannot leave the boundaries of the plateau! Please adjust direction before moving."
		# elsif @y > @@y || @y < 0
		# 	puts "Error: Rover cannot leave the boundaries of the plateau! Please adjust direction before moving."
		# else
			case @d 
			when "N"
				@y += 1
			when "E"
				@x += 1
			when "S"
				@y -= 1
			when "W"
				@x -= 1
			end
		#end
	end
	def self.plateau_boundaries(str)
		@@x = str[0]
		@@y = str[2]
	end
end	

Rover.plateau_boundaries('5 5')

puts rover1 = Rover.new(1, 2, "N")
puts rover1.execute_commands('LMLMLMLMM')

# rover2 = Rover.new('3 3 E')
# rover2.execute_commands('MMRMMRMRRM')

