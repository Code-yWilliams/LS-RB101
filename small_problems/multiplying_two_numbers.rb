=begin
Create a method that takes two arguments, multiplies them together, and returns the result.

Further Exploration:
For fun: what happens if the first argument is an Array? What do you think is happening here?
=end

def multiply(num_a, num_b)
  num_a * num_b
end

puts multiply(8, 3) == 24

# Further Exploration

p multiply(["apple", "milk", "cheese"], 4)