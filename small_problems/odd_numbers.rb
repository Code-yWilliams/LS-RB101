=begin
Print all odd numbers from 1 to 99, inclusive,
to the console, with each number on a separate line.

Further Exploration
Repeat this exercise with a technique different from
the one you just used, and different from the provided solution. 
You may want to explore the use Integer#upto or Array#select methods,
or maybe use Integer#odd?
=end

(1..99).each do |number|
 puts number if number % 2 == 1
end

# LS solution:

value = 1
while value <= 99
  puts value
  value += 2
end

# Further exploration

1.upto(100) {|num| puts num if num.odd?}

# OR

1.step(100, 2) {|numba| puts numba}