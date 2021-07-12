=begin
#1
How would you order this array of number strings by descending numeric value?
=end

arr = ['10', '11', '9', '7', '8']
arr.sort do |a, b|
  b.to_i <=> a.to_i
end



=begin
#2
How would you order this array of hashes based on the year of publication
of each book, from the earliest to the latest?
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash[:published].to_i
end


=begin
#3
For each of these collection objects demonstrate how
you would reference the letter 'g'.
=end

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)


=begin
#4
For each of these collection objects where the value 3 occurs,
demonstrate how you would change this to 4.
=end

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


=begin
#5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

figure out the total age of just the male members of the family.
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_pair do |_, value|
  if value["gender"] == "male"
    total_male_age += value["age"]
  end
end
# NOTE: could use .each_value instead since we don't access any keys


=begin
#6
Using the same hash, print out the name, age and gender of each family member
like this:
(Name) is a (age)-year-old (male or female).
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  name = key
  age = value["age"]
  gender = value["gender"]
  puts "#{name} is a #{age}-year-old #{gender}"
end


=begin
#8
Using the each method, write some code to output all of the vowels from the strings.
=end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = ["a", "e", "i", "o", "u"]
hsh.each_value do |value|
  value.each do |word|
    word.chars.each do |char|
      puts char if VOWELS.include?(char)
    end
  end
end

=begin
#9
Given this data structure, return a new array of the same structure
but with the sub arrays being ordered (alphabetically or numerically
as appropriate) in descending order.
=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.each do |sub_array|
  sub_array.sort! do |a, b|
    b <=> a
  end
end

#NOTE - this is wrong because it did not return a new array. .map would be better


=begin
#10
Given the following data structure and without modifying the original array,
use the map method to return a new array identical in structure to the original
but where the value of each integer is incremented by 1.
=end

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  return_hash = {}
  hash.each do |k, v|
    return_hash[k] = v + 1
  end
  return_hash
end


=begin
#11
Given the following data structure use a combination of methods,
including either the select or reject method, to return a new array
identical in structure to the original but containing only the
integers that are multiples of 3.
=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |arr1|
  arr1.select do |num|
    num % 3 == 0
  end
end


=begin
#12
Given the following data structure, and without using the Array#to_h method,
write some code that will return a hash where the key is the first item in
each sub array and the value is the second item.
=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end


=begin
#13
Given the following data structure, return a new array containing
the same sub-arrays as the original but ordered logically by only
taking into consideration the odd numbers they contain.
=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.sort_by do |arr|
  arr.select do |num|
    num.odd?
  end
end


=begin
#14
Given this data structure write some code to return an array containing
the colors of the fruits and the sizes of the vegetables.
The sizes should be uppercase and the colors should be capitalized.
=end


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = []
hsh.each do |k, v|
  if hsh[k][:type] == 'fruit'
    result << hsh[k][:colors]
  else
    result << hsh[k][:size]
  end
end

result.each do |element|
  if element.kind_of?(Array)
    element.each do |color|
      color.capitalize!
    end
  else
    element.upcase!
  end
end

# OR

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end


=begin
#15
Given this data structure write some code to return an array which
contains only the hashes where all the integers are even.
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, v|
    v.all? do |num|
      num.even?
    end
  end
end


=begin
#16
A UUID is a type of identifier often used as a way to uniquely identify items...
which may not all be created by the same system. 
That is, without any form of synchronization, two or more separate computer systems
can create new items and label them with a UUID with no significant chance of stepping
on each other's toes.

Each UUID consists of 32 hexadecimal characters, and is typically broken into
5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end

HEX = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

def random_char(number)
  str = ""
  number.times do 
    str << HEX[rand(0..15)]
  end
  str
end

def make_uuid
  "#{random_char(8)}-#{random_char(4)}-#{random_char(4)}-#{random_char(4)}-#{random_char(12)}"
end





