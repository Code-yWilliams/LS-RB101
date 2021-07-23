=begin
Write a method that can rotate the last n digits of a number. For example:

Copy Code
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.
=end

def rotate_array(arr)
  new_arr = arr.dup
  last = new_arr.shift
  new_arr << last
end

def rotate_rightmost_digits(num, rightmost_digits)
  digits = num.to_s.chars
  rightmost_digits = rotate_array(digits.pop(rightmost_digits))
  digits << rightmost_digits
  digits.flatten.join("").to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
