=begin
Write a method that returns the next to last word in the String passed to it as an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

Further Exploration:
Suppose we need a method that retrieves the middle word of a phrase/sentence.
What edge cases need to be considered? How would you handle those edge cases
without ignoring them? Write a method that returns the middle word of a phrase or sentence.
It should handle all of the edge cases you thought of.
=end

def penultimate(string)
  words = string.split(" ")
  words[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


=begin
Further Exploration:
Edge cases to address: 
  Empty String
  Even number of words
  String with no letters 
=end


def middle_word(string)
  Letters = ("A".."Z").to_a + ("a".."z").to_a
  return "No String" if string.size == 0 # first edge case
  words = string.split
  middle_index = (words.size / 2).floor - 1 # second edge case (addressed via .floor)
  middle_word = words[middle_index]
  return "Not a word" of middle_word.chars.none? {|letter| Letters.include?} # third edge case
  middle_word
end