=begin
Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. 
Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.
=end

def reverse_words(string)
  words = string.split(" ")
  words.collect! do |word|
    if word.size >= 5
      word.reverse!
    else
      word
    end
  end
  words.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

#or

def word_reverse(string)
  string.split.collect do |word| 
    word.size >= 5 ? word.reverse : word
  end.join(" ")
end

puts word_reverse("My name is Cody Williams and I despise cucumber")