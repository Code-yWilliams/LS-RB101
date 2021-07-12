=begin
Write a method that takes an Array as an argument,
and reverses its elements in place; that is,
mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.
=end

def reverse!(array)
  work_array = []
  array.each do |element|
    work_array << element
  end
  counter = 0
  loop do
    array[counter] = work_array[-(counter + 1)]
    break array if counter  == (array.size - 1)
    counter += 1
  end
end

list1 = [1,2,3,4]
result = reverse!(list1)
p result == [4, 3, 2, 1] # true
p list1 == [4, 3, 2, 1] # true
p list1.object_id == result.object_id # true

list2 = %w(a b e d c)
p reverse!(list2) == ["c", "d", "e", "b", "a"] # true
p list2 == ["c", "d", "e", "b", "a"] # true

list3 = ['abc']
reverse!(list3) == ["abc"] # true
list3 == ["abc"] # true

list4 = []
reverse!(list4) == [] # true
list4 == []