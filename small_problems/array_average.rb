=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
The array will never be empty and the numbers will always be positive integers. 
Your result should also be an integer.

Further Exploration:
Currently, the return value of average is an Integer. 
When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a Float. 
Can you change the return value of average from an Integer to a Float?
=end

def average(integer_array)
  sum = 0
  integer_array.each do |element|
    sum += element
  end
  sum.to_f / integer_array.count.to_f #see Further Exploration
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.0
puts average([9, 47, 23, 95, 16, 52]) == 40.0