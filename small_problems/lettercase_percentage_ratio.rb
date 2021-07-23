=begin
Write a method that takes a string, and then returns a hash that contains
3 entries: one represents the percentage of characters in the string that
are lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

Further Exploration:
If we passed a string 'abcdefGHI' as an argument to our method call the solution
would be {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}.
It would be nicer if we could round these float numbers so that our solution looks
like this {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}.
Try creating that solution on your own.
=end

def is_letter?(char)
  ("A".."Z").include?(char.upcase)
end

def letter_percentages(string)
  total_chars = string.chars.size.to_f
  lowercases = 0
  uppercases = 0
  neithers = 0

  chars = string.split("")
  chars.each do |char|
    if is_letter?(char)
      if char.downcase == char
        lowercases += 1
      else
        uppercases += 1
      end
    else
      neithers += 1
    end
  end
  ratios = {
    lowercase: ((lowercases / total_chars) * 100).round(2), # Further Exploration: use .round(2)
    uppercase: ((uppercases / total_chars) * 100).round(2), # This rounds 2 2nd decimal place
    neither: ((neithers / total_chars) * 100).round(2)
  }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')