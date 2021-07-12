=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +,
your method should return a positive number; if it is a -,
your method should return a negative number. If no sign is given,
you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby,
such as String#to_i, Integer(), etc. You may, however,
use the string_to_integer method from the previous lesson.

Further Exploration:
In our solution, we call string[1..-1] twice,
and call string_to_integer three times. This is somewhat repetitive.
Refactor our solution so it only makes these two calls once each.

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end
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

def string_to_signed_i(string)
  chars = string.chars
  if chars[0] == "-"
    sign = -1
    chars.delete("-")
  elsif chars[0] == "+"
    sign = 1
    chars.delete("+")
  else
    sign = 1
  end
  digits = chars.map {|char| DIGITS[char]}
  integer = 0
  digits.each {|digit| integer = (integer * 10) + digit}
  integer * sign
end


puts string_to_signed_i('4321') == 4321
puts string_to_signed_i('-570') == -570
puts string_to_signed_i('+100') == 100





# Further Exploration:
def string_to_i(string)
  chars = string.split("")
  digits = chars.map {|char| DIGITS[char]}
  integer = 0
  digits.each {|digit| integer = (integer * 10) + digit}
  integer
end

def string_to_signed_integer(string)
  string[0] == "-" ? sign = -1 : sign = 1
  string.delete!("+-")
  string_to_i(string) * sign
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100