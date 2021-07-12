=begin
Write a method that returns true if the string passed as an argument
is a palindrome, false otherwise. A palindrome reads the same forward
and backward. For this exercise, case matters as does punctuation and spaces.

Further Exploration:
Write a method that determines whether an array is palindromic; that is,
the element values appear in the same sequence both forwards and backwards
in the array. Now write a method that determines whether an array or a string
is palindromic; that is, write a method that can take either an array or a string
argument, and determines whether that argument is a palindrome. 
You may not use an if, unless, or case statement or modifier.
=end

def palindrome?(string)
  return true if string.reverse == string
  false
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Further Exploration

# Palindromic Array
def palindromic_array?(array)
  return true if array.reverse == array
  false
end

puts palindromic_array?([1, 2, 3, 2, 1]) == true

# Palindromic Array Or String (no if, unless, case statement or modifier)

def palindromic?(array_or_string)
  return array_or_string.reverse == array_or_string
  false
end

puts palindromic?("racecar") == true
puts palindromic?(["cow", "pig", "chicken", "pig", "cow"]) == true



