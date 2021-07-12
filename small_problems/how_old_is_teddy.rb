=begin
Build a program that randomly generates and prints Teddy's age. 
To get the age, you should generate a random number between 20 and 200.

Further Exploration:
Modify this program to ask for a name, and then print the age for that person. 
For an extra challenge, use "Teddy" as the name if no name is entered.
=end

rand_age = rand(20..200)

def print_age(name="Teddy", rand_age)
 puts "#{name} is #{rand_age} years old!"
end

puts "What is your name?"
user_name = gets.chomp
if user_name.empty?
  user_name = "Teddy"
end

print_age(user_name, rand_age)