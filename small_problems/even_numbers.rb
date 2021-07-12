=begin
Print all even numbers from 1 to 99, inclusive,
to the console, with each number on a separate line.
=end

counter = 1
until counter > 100
  puts counter if counter % 2 == 0
  counter += 1
end