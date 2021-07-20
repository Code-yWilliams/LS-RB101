=begin
Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first,
then all substrings that start at position 1, and so on.
Since multiple substrings will occur at each position,
the substrings at a given position should be returned
in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:
=end

# With the leading_substring method:

def leading_substrings(string)
  result = []
  1.upto(string.size) do |count|
    result << string.slice(0, count)
  end
  result
end

def substrings(string)
  result = []
  (0..string.size).each do |count|
    current_string = string[count..-1]
    result << leading_substrings(current_string)
  end
  result.flatten.uniq
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


# Without the leading_substring method:

def substrings2(string)
  result = []
  letters = string.chars
  letters.each_with_index do |_, index|
    1.upto(string.size) do |count|
    result << string.slice(index, count)
    end
  end
  result.uniq
end

p substrings2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]