=begin
Given a string of words separated by spaces,
write a method that takes this string of words
and returns a string in which the first and last
letters of every word are swapped.


def swap(string)
  words = string.split(" ")
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  words.join(" ")
end

puts swap("waffle bitch")

=end


def letter_swap(string)
  words = string.split(" ")
  words.map do |word|
    first = word[0]
    word[0] = word[-1]
    word[-1] = first
  end
  words.join(" ")
end

p letter_swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p letter_swap('Abcde') == 'ebcdA'
p letter_swap('a') == 'a'