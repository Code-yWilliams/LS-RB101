=begin
Write a method that takes a string, and then returns a hash
that contains 3 entries: one represents the number of characters
in the string that are lowercase letters, one the number of
characters that are uppercase letters, and one the number
of characters that are neither.
=end

CAPS = ("A".."Z")
LOWS = ("a".."z")



def letter_case_count(string)
  result = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if CAPS.include?(char)
      result[:uppercase] += 1
    elsif LOWS.include?(char)
      result[:lowercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }