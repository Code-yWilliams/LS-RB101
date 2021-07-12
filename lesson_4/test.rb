def all_substrings(string)
substrings = []
index = 0
  until index > string.size - 2
    range = 2
    until range > (string.size - index)
      substrings << string[index, range]
    range += 1
    end
  index += 1
  end
  substrings
end

def is_palindrome?(substr)
  substr.reverse == substr ? true : false
end

def palindrome_substrings(string)
  palindromes = []
  substrings = all_substrings(string)
  substrings.each do |substr|
    palindromes << substr if is_palindrome?(substr)
  end
  palindromes
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("racecar")
p palindrome_substrings("abcddcbA")
