=begin
Write a method that takes a non-empty string argument, and returns the middle character
or characters of the argument. If the argument has an odd length, you should return
exactly one character. If the argument has an even length, you should return exactly two characters.
=end

def center_of(string)
  characters = string.chars
  result = ""
  if string.size.even?
    middle_index1 = ((string.size) / 2) - 1
    middle_index2 = (string.size) / 2
    result << string[middle_index1..middle_index2]
  else
    middle_index = ((string.size) / 2).floor
    result << string[middle_index]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'