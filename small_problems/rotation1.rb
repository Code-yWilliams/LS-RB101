=begin
Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

Further Exploration:
Write a method that rotates a string instead of an array. Do the same thing for integers.
You may use rotate_array from inside your new method.
=end

def rotate_array(arr)
  new_arr = arr.dup
  last = new_arr.shift
  new_arr << last
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration:

def rotate_string(string)
  rotate_array(string.split("")).join("")
end

p rotate_string("Hi I'm Cody")

def rotate_int(int)
  rotate_string(int.to_s)
end

p rotate_int(1234)