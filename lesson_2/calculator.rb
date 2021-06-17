# ask the user for two numbers
# as the user for an operation to perform on the two numbers
# perform the operation on the two numbers
# output the result

puts "Welcome to Calculator"
puts "What's the first number?"
first_number = gets.chomp
puts "What's the second number?"
second_number = gets.chomp
puts "What operation do you want to perform on these two numbers? Enter 1 for add, 2 for subtract, 3 for multiply, and 4 for divide."
operator = gets.chomp

case operator
when "1"
  result = first_number.to_i + second_number.to_i
when "2"
  result = first_number.to_i - second_number.to_i
when "3"
  result = first_number.to_i * second_number.to_i
when "4"
  result = first_number.to_f / second_number.to_f
end

puts "The result is #{result}""
