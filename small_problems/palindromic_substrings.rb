=begin
Write a method that returns a list of all substrings of a string that are palindromic.
That is, each substring must consist of the same sequence of characters forwards as it
does backwards. The return value should be arranged in the same sequence as the substrings
appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case;
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
In addition, assume that single characters are not palindromes.

Further Exploration:
Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters
and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.
=end

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
  result.flatten
end

def palindromes(string)
  substrings(string).keep_if {|substring| substring == substring.reverse && substring.size > 1}
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration:

def palindromes(string)
  alphanumeric_string = string.gsub(/[^A-Za-z0-0]/, " ")
  substrings(alphanumeric_string).keep_if {|substring| substring.downcase == substring.reverse.downcase && substring.size > 1}
end
