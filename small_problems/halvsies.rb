=begin
Write a method that takes an Array as an argument,
and returns two Arrays (as a pair of nested Arrays)
that contain the first half and second half of the
original Array, respectively. If the original array 
contains an odd number of elements, the middle element
should be placed in the first half Array.
=end

def halvsies(array)
  result = []
  half = array.size.odd? ? (((array.size / 2.0).ceil) - 1) : (array.size / 2) - 1
  result << array.values_at(0..half)
  result << array.values_at((half + 1)..-1)
  result
end


# OR

def halvsies2(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end
