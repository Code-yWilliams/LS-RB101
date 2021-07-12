=begin
Write a method that takes an Array of numbers,
and returns an Array with the same number of elements,
and each element has the running total from the original Array.

Further Exploration:
Try solving this problem using Enumerable#each_with_object
or Enumerable#inject (note that Enumerable methods can be applied to Arrays).
=end

def running_total(array)
  sum = 0
  array.collect {|num| sum += num}
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# Further Exploration:

def run_total(array_a)
  array_a.each_with_object([]) do |num, array_b|
    if array_b.empty?
      array_b << num
    else
      array_b << num + array_b[-1]
    end
  end
end

puts run_total([2, 5, 13]) == [2, 7, 20]
puts run_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts run_total([3]) == [3]
puts run_total([]) == []