# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(int)
  int.to_s.split("").map(&:to_i)
end

p digit_list(143567)

