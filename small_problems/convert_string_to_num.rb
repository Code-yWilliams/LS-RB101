=begin
Write a method that takes a String of digits,
and returns the appropriate number as an integer.
You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs,
nor should you worry about invalid characters;
assume all characters will be numeric.

You may not use any of the standard conversion methods
available in Ruby to convert a string to a number,
such as String#to_i, Integer(), etc. 
Your method should do this the old-fashioned way and
calculate the result by analyzing the characters in the string.

Further Exploration:
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.
=end

DIGITS = {
"0" => 0,
"1" => 1,
"2" => 2,
"3" => 3,
"4" => 4,
"5" => 5,
"6" => 6,
"7" => 7,
"8" => 8,
"9" => 9
}

def string_to_i(string)
  chars = string.split("")
  digits = chars.map {|char| DIGITS[char]}
  integer = 0
  digits.each {|digit| integer = (integer * 10) + digit}
  integer
end

p string_to_i('4321') # == 4321
p string_to_i('570') # == 570

# Further Exploration:

HEX_DIGITS = {
"0" => 0,
"1" => 1,
"2" => 2,
"3" => 3,
"4" => 4,
"5" => 5,
"6" => 6,
"7" => 7,
"8" => 8,
"9" => 9,
"A" => 10,
"B" => 11,
"C" => 12,
"D" => 13,
"E" => 14,
"F" => 15
}


def hex_string_to_i(string)
  digits = string.chars.map {|char| HEX_DIGITS[char]}
  integer = 0
  digits.each {|digit| integer = (integer * 16) + digit}
  integer
end

p hex_string_to_i("4D9F")

=begin
def hex_string_to_i(string)
chars = string.split("")
digits = chars.map {|char| HEX_DIGITS[char]}
integer = 0
digits.each {|digit| integer = (integer * 16) + digit}
integer
end

puts hex_string_to_i('4D9f') == 19871
=end
