=begin
Given a string that consists of some words (all lowercased)
and an assortment of non-alphabetic characters, write a method
that returns that string with all of the non-alphabetic characters
replaced by spaces. If one or more non-alphabetic characters occur
in a row, you should only have one space in the result
(the result should never have consecutive spaces).
=end

VALID_CHARS = ("a".."z").to_a #+ [" "]

def cleanup(string)
  new_word_array = []
  chars = string.split("")
  chars.each do |char|
    if VALID_CHARS.include?(char)
      next
    else
      char.replace(" ")
    end
  end
  chars.each do |char|
    new_word_array << char unless (char == " " && new_word_array[-1] == " ")
  end
  new_word_array.join("")
end
  
p cleanup("---what's my +*& line?") # == ' what s my line '
