=begin
Write a method that takes a positive integer as an argument and returns
that number with its digits reversed.
=end

def reversed_number(num)
  result = ""
  num.to_s.chars.each do |char|
    result.prepend(char)
  end
  result.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# OR

def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end