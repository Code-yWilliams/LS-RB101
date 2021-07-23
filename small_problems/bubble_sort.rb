=begin
Write a method that takes an Array as an argument, and sorts that Array
using the bubble sort algorithm as just described. Note that your sort
will be "in-place"; that is, you will mutate the Array passed as an argument.
You may assume that the Array contains at least 2 elements.

Further Exploration:
Note that we did not use the optimization suggested on the Wiki page that
skips looking at tail elements that we know are already sorted. If your
solution also skipped this optimization, try modifying your solution so
it uses that optimization.
=end

def bubble_sort!(array)
  loop do
    max_index = array.size
    index1 = 0
    index2 = 1
    swap = 0
      until index2 == max_index
        if array[index1] < array[index2]
          index1 += 1
          index2 += 1
        elsif array[index1] > array[index2]
          array[index1], array[index2] = array[index2], array[index1]
          swap += 1
          index1 += 1
          index2 += 1
        end
      end
      max_index -= 1 # Further Exploration
    break if swap == 0
  end
  array
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)