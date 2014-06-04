class Person
	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hello, my name is #{@name}!"
	end
end

class Student < Person
	
	def learn
		puts "I get it!"
	end
end

class Instructor < Person

	def teach 
		puts "Everything in Ruby is an object!"
	end
end

instructor = Instructor.new("Chris")
instructor.greeting
instructor.teach
instructor.learn

student = Student.new("Cristina")
student.greeting
student.learn
student.teach

# These last two calls do not work because methods being called on each of the objects 
# 	are not local to the classes they are called on. You are able to call methods
# 	from the person class because both the Instructor and Student classes inherit
# 	from Person.