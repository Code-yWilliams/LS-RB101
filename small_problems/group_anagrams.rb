=begin

Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams.
Anagrams are words that have the same exact letters in them but in
a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]

=end

def anagrams(array)
  words = []
  array.each do |word|
    words << array.select do |element|
      element.chars.all? do |char|
        word.include?(char)
      end
    end
  end
  words.uniq.each {|set| p set}
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


anagrams(words)