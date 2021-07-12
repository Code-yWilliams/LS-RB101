=begin
Write a program that prompts the user for two positive integers,
and then prints the results of the following operations on those
two numbers: addition, subtraction, product, quotient, remainder,
and power. Do not worry about validating the input.
=end

def prompt(message)
  puts "==> #{message}"
end


def add(num_a, num_b)
  puts "#{num_a} + #{num_b} = #{num_a + num_b}"
end

def subtract(num_a, num_b)
  puts "#{num_a} - #{num_b} = #{num_a - num_b}"
end

def multiply(num_a, num_b)
  puts "#{num_a} * #{num_b} = #{num_a * num_b}"
end

def divide(num_a, num_b)
  puts "#{num_a} / #{num_b} = #{num_a / num_b}"
end

def remainder(num_a, num_b)
  puts "#{num_a} % #{num_b} = #{num_a % num_b}"
end

def power(num_a, num_b)
  puts "#{num_a} ** #{num_b} = #{num_a ** num_b}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_f

prompt("Enter the second number:")
second_number = gets.chomp.to_f

add(first_number, second_number)
subtract(first_number, second_number)
multiply(first_number, second_number)
divide(first_number, second_number)
remainder(first_number, second_number)
power(first_number, second_number)

