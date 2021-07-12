=begin
Write a method named include? that takes an Array
and a search value as arguments. This method should
return true if the search value is in the array,
false if it is not.
You may not use the Array#include? method in your solution.
=end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# OR 
def include2(array, value)
  !!array.find_index(value)
end

# OR

def include3(array, search)
  !array.select { |element| element == search }.empty?
end

# OR

def include4(array, search)
  array << search
  return true if array.uniq! != nil
  false
end