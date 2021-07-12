=begin
Write a method that returns true if its integer argument is palindromic,
false otherwise. A palindromic number reads the same forwards and backwards.

=end

def palindromic_number?(int)
  int.to_s.reverse == int.to_s
end 

puts palindromic_number?(003454300) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true




