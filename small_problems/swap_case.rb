=begin
Write a method that takes a string as an argument and returns a
new string in which every uppercase letter is replaced by its
lowercase version, and every lowercase letter by its uppercase version.
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.
=end

CAPS = ("A".."Z")
LOWS = ("a".."z")

def swapcase(string)
  result = ""
  letters = string.split("")
  letters.each do |letter|
    if CAPS.include?(letter)
      result << letter.downcase
    elsif LOWS.include?(letter)
      result << letter.upcase
    else
      result << letter
    end
  end
  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

