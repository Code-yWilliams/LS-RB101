=begin
Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument (the square is
the result of multiplying a number by itself).

Further Exploration: 
What if we wanted to generalize this method to a "power to the n"
type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so
while still using the multiply method?
=end

def multiply(num_a, num_b)
  num_a * num_b
end

def square(num_a)
  multiply(num_a, num_a)
end

puts square(5) == 25
puts square(-8) == 64

# Further Exploration

def power(num, power)
  array = []

  power.times do 
    array << num
  end

  array.reduce do|result, num| 
    multiply(result, num)
  end
end

p power(2, 1)
