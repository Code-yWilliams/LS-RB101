=begin
Write a method that takes a string argument, and returns true if all of the alphabetic
characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.
=end



def uppercase?(string)
  letters = ("A".."Z").to_a + ("a".."z").to_a
  caps = ("A".."Z").to_a
  alphabetic = string.chars.keep_if {|char| letters.include?(char)}.join("")
  alphabetic.split("").all? {|char| caps.include?(char)} ? true : false
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true