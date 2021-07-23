=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the rotate_rightmost_digits
method from the previous exercise.

Note that you do not have to handle multiple 0s.

Further Exploration:
Further Exploration
Assume you do not have the rotate_rightmost_digits or rotate_array methods.
How would you approach this problem? Would your solution look different?
Does this 3 part approach make the problem easier to understand or harder?

There is an edge case in our problem when the number passed in as the argument
has multiple consecutive zeros. Can you create a solution that preserves zeros?
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
  digits.flatten.join("")
end

def max_rotation(num)
  num_size = num.to_s.size
  until num_size == 0
    num = rotate_rightmost_digits(num, num_size)
    num_size -= 1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
Further Exploration:
Problem is easier to understand with three different methods (in my opinion).
BUT, it is shorter to just rewrite it as follows.
To preserve leading zeros, we must leave the result as a string. We cannot turn it
back into an integer because integers do not preserve leading 0s
=end


def max_rotation(num)
  arr = num.to_s.chars
  arr.each_with_index { |_, index| arr << arr.delete_at(index) }
  arr[0] == '0' ? arr.join("") : arr.join.to_i
end

