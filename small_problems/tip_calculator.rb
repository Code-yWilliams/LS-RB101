=begin
Create a simple tip calculator.
The program should prompt for a bill amount and a tip rate.
The program must compute the tip and then display both the
tip and the total amount of the bill.

Further Exploration
Our solution prints the results as $30.0 and $230.0 
instead of the more usual $30.00 and $230.00. 
Modify your solution so it always prints the results with 2 decimal places.
=end

puts "What's the total of the bill?"
total = gets.chomp.to_f

puts "What percentage do you want to tip?"
percent = gets.chomp.to_f

percentage = percent / 100

tip = (total * percentage).round(2)
total = (total + tip).round(2)

puts "The tip is %0.2f" % [tip]
puts "The total is %0.2f" % [total]