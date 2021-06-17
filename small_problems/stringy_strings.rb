=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. 
The length of the string should match the given integer.

Further Exploration:
Modify stringy so it takes an additional optional argument that defaults to 1. 
If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.
=end

def stringy(int, optional = 1)
  string = ""
  if optional == 1
    loop do
      string.size.even? ? string << "1" : string << "0"
        break string if string.size == int
    end
  else #see Further Exploration
    loop do
      string.size.even? ? string << "0" : string << "1"
        break string if string.size == int
    end
  end
end

puts stringy(6, 0) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'