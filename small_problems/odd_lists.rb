=begin
Write a method that returns an Array that contains every
other element of an Array that is passed in as an argument.
The values in the returned list should be those values that
are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Further Exploration:
Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
Try to solve this exercise in at least 2 additional ways.
=end

def oddities(array)
  new_array = []
  array.each_with_index do |element, index|
    new_array << element if index.even?
  end
  new_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Further Exploration:

# Returning evens
def evens(array)
  new_array = []
  array.each_with_index do |element, index|
    new_array << element if index.odd?
  end
  new_array
end

# Two additional ways of returning odd values

# 1
def another_way(array)
  new_array = []
  index = 0
  loop do
    new_array << array[index]
    index += 2
    break if index > (array.size - 1)
  end
  new_array
end

puts another_way([2, 3, 4, 5, 6]) == [2, 4, 6]

#2
def third_way(array)
  array.delete_if do |element|
  array.index(element).odd?
  end
end

puts another_way([2, 3, 4, 5, 6]) == [2, 4, 6]