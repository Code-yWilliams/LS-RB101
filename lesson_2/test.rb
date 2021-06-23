array = [1, 2, 3, 4, 5]
b = array.each.tap {|x| x + 3}
puts b

hello = 'hi'

def hello
  "Saying hello!"
end

puts hello 