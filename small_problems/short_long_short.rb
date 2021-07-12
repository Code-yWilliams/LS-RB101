=begin
Write a method that takes two strings as arguments,
determines the longest of the two strings, and then
returns the result of concatenating the shorter string,
the longer string, and the shorter string once again.
You may assume that the strings are of different lengths.
=end

def short_long_short(word_a, word_b)
  if word_a.size > word_b.size
    return word_b + word_a + word_b
  else
    return word_a + word_b + word_a
  end
end
# note: could use ternary operator to shorten


puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# OR

def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end