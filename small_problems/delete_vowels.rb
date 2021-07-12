=begin
Write a method that takes an array of strings,
and returns an array of the same string values,
except with the vowels (a, e, i, o, u) removed.
=end
VOWELS = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]

def remove_vowels(array)
  result = []
  array.each_with_index do |string, index|
    string.each_char do |char|
      result[index] ||= ""
      result[index] << char unless VOWELS.include?(char)
    end
  end
  result
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']