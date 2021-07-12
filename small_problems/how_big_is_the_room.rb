=begin
Build a program that asks a user for the length and width of a room
in meters and then displays the area of the room in both square meters
and square feet.
Note: 1 square meter == 10.7639 square feet
Do not worry about validating the input at this time.

Further Exploration:
Modify this program to ask for the input measurements in feet,
and display the results in square feet, square inches, and square centimeters.
=end

SQM_TO_SQFT = 10.7639

puts "What is the length of the room in meters?"
length = gets.chomp.to_f

puts "What is the width of the room in meter?"
width = gets.chomp.to_f

area_meters = length * width
area_sq_ft = area_meters * SQM_TO_SQFT

puts "The area of the room is #{area_meters} " + \
"square meters (#{area_sq_ft} square feet)"

# further exploration:

SQFT_TO_SQIN = 144.0
SQFT_TO_SQCM = 929.0

puts "What is the length of the room in feet?"
length = gets.chomp.to_f

puts "What is the width of the room in feet?"
width = gets.chomp.to_f

area_sq_ft = length * width
area_sq_in = area_sq_ft * SQFT_TO_SQIN
area_sq_cm = area_sq_ft * SQFT_TO_SQCM

puts "The area of the room is #{area_sq_ft} " + \
"square feet (#{area_sq_in} square inches, " + \
"or #{area_sq_cm} square centimeters)"