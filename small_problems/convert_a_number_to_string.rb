=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. 
Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.
=end

STR_DIGITS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9"
}

def integer_to_string(int)
 string = ""
 loop do
 int, remainder = int.divmod(10)
 string.prepend(STR_DIGITS[remainder])
 break if int == 0
 end
 string
end

puts integer_to_string(4321) # == '4321'
puts integer_to_string(0) # == '0'
puts integer_to_string(5000) # == '5000'