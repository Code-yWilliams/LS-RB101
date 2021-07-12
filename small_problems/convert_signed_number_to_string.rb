=begin
Write a method that takes a signed integer, and converts it to a string representation.
You may not use any of the standard conversion methods available in Ruby, 
such as Integer#to_s, String(), Kernel#format, etc. You may, however, 
use integer_to_string from the previous exercise.

Further Exploration:
Refactor our solution to reduce the 3 integer_to_string calls to just one.
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
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
  int, remainder = int.abs.divmod(10)
  string.prepend(STR_DIGITS[remainder])
  break if int == 0
  end
  string
 end

def signed_integer_to_string(int)
  case int <=> 0
  when -1 then sign = "-"
  when 1 then sign = "+"
  else sign = ""
  end

  integer_to_string(int).prepend(sign)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

# Further Exploration:


def signed_int_to_string(number)
  case number <=> 0
  when -1 then sign = "-"
  when +1 then sign "+"
  else sign = ""
  end
sign + integer_to_string
end
