=begin
Write a program that solicits 6 numbers from the user,
then prints a message that describes whether or not
the 6th number appears amongst the first 5 numbers.
=end

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the 1st number:")
first = gets.chomp.to_i

prompt("Enter the 2nd number:")
second = gets.chomp.to_i

prompt("Enter the 3rd number:")
third = gets.chomp.to_i

prompt("Enter the 4th number:")
fourth = gets.chomp.to_i

prompt("Enter the 5th number::")
fifth = gets.chomp.to_i

prompt("Enter the 6th number:")
sixth = gets.chomp.to_i

first_five = [first, second, third, fourth, fifth]

if first_five.include?(sixth)
  puts "The number #{sixth} appears in #{first_five}."
else
  puts "The number #{sixth} does not appear in #{first_five}."
end

=begin Note: can also create an empty first_five array 
at the beginning and then << each input to the array 
after each prompt
=end