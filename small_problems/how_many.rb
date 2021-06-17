=begin
Write a method that counts the number of occurrences of each element in a given array.
Once counted, print each element alongside the number of occurrences.
=end

def count_occurrences(array)
  elements = {}
  array.collect! {|element| element.downcase}
  array.uniq.each do |element|
    elements[element] = array.count(element)
  end
 elements.each do |key, value|
  puts "#{key} => #{value}"
 end
end

vehicles = [
  'car', 'cAr', 'Truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motOrcycle', 'car', 'truck'
]

count_occurrences(vehicles)