=begin
Build a program that displays when the user will retire and 
how many years she has to work till retirement.
=end

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_to_go = retirement_age - age

current_year = Time.now.year
retirement_year = current_year + years_to_go

puts "It is #{current_year}. You will retire in #{retirement_year}"
puts "You have only #{years_to_go} years of work left!"