
def joinor(array, punctuation="", ending_word="or")
  new_arr = array.map { |number| number.to_s }.join("#{punctuation} ")
  new_arr[-1] = "#{ending_word} #{new_arr[-1]}"
  new_arr
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], ';')          # => "1; 2; or 3"
p joinor([1, 2, 3], ',', 'and')   # => "1, 2, and 3"