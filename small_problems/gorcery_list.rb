=begin
Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit.
=end

def buy_fruit(array)
  result = []
  array.each do |sub_arr|
    (sub_arr[1]).times do 
      result << sub_arr[0]
    end
  end
  result 
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]