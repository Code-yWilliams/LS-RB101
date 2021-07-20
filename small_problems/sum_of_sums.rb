=begin
Write a method that takes an Array of numbers and then returns the sum of the sums
of each leading subsequence for that Array. You may assume that the Array always
contains at least one number.
=end

def sum_of_sums(array)
  temp_arr = array
  subsequences = []
  until temp_arr.size == 0 do 
    subsequences << temp_arr.dup
    temp_arr.pop
  end
  subsequences = subsequences.map {|sub_arr| sub_arr.reduce(:+)}
  subsequences.reduce(:+)
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
