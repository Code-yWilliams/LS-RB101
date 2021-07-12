=begin
Write another method that returns true if the string passed
as an argument is a palindrome, false otherwise. This time,
however, your method should be case-insensitive, and it should
ignore all non-alphanumeric characters.
=end

def only_alphanumerics(string)
  string.downcase!
  string_characters = string.split("")
  string_characters.each do |element|
  string_characters.delete(element) unless ("a".."z").include?(element)
  end
  string_characters.join
end

def palindrome?(string)
  only_alphanumerics(string).reverse == only_alphanumerics(string)
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == true           # (case does not matter)
puts palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts palindrome?('356653') == true
puts palindrome?('356a653') == true
puts palindrome?('123ab321') == false

# OR

def pal?(str)
  formatted_str = str.downcase.delete("^a-z0-9")
  formatted_str.reverse == formatted_str
end

puts pal?('madam') == true
puts pal?('Madam') == true           # (case does not matter)
puts pal?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts pal?('356653') == true
puts pal?('356a653') == true
puts pal?('123ab321') == false