=begin
Write a method that takes a single String argument and returns
a new string that contains the original value of the argument
with the first character of every word capitalized and all
other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Further Exploration:
Ruby conveniently provides the String#capitalize method to capitalize strings.
Without that method, how would you solve this problem?
Try to come up with at least two solutions.
=end

def word_cap1(string)
  words = str.split(" ").map do |word|
    word.capitalize
  end
  words.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# Further Exploration 1:
def word_cap2(string)
  words = string.split(" ")
  words_array = words.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end
  words_array.join(" ")
end


# Further Exploration 2:

LOWS = ("a".."z")
HIGHS = ("A".."Z")

def word_cap3(string)
  result_array = []
  words = string.split(" ")
  words.each do |word|
    letters = word.split("")
    first_letter = letters.shift
    if LOWS.include?(first_letter) && word == words[0]
      first_letter = (first_letter.ord - 32).chr
    end
    letters.each do |letter|
      if HIGHS.include?(letter)
        letter = (letter.ord + 32).chr
      end
    end
    letters.prepend(first_letter)
    letters = letters.join("")
    letters
    result_array << letters
  end
  result_array.join(" ")
end




