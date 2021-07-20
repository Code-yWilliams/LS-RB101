=begin
Write a method that takes two Array arguments in which each Array contains
a list of numbers, and returns a new Array that contains the product of
each pair of numbers from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.

Further Exploration:
The Array#zip method can be used to produce an extremely compact solution
to this method. Read the documentation for zip, and see if you can come up
with a one line solution (not counting the def and end lines).
=end

def multiply_list(arr1, arr2)
  index = 0
  result = []
  until index == arr1.size do 
    product = arr1[index] * arr2[index]
    result << product
    index += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


# Further Exploration:


def mult_list(arr1, arr2)
  result = []
  arr1.zip(arr2) { |elem1, elem2| result << elem1 * elem2 }
  result
end

# OR

def multiplist(arr1, arr2)
  result = arr1.zip(arr2).map {|sub_arr| sub_arr.reduce {|product, num| num * product} }
end

# OR

def multiplist2(arr1, arr2)
  result = arr1.zip(arr2).map {|sub_arr| sub_arr.reduce(:*)}