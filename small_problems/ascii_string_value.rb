=begin
Write a method that determines and returns the ASCII string value
of a string that is passed in as an argument. The ASCII string value
is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

Further Exploration:
There is an Integer method such that:
  char.ord.mystery == char
where mystery is our mystery method.
Can you determine what method name should be used
in place of mystery? 
What happens if you try this with a longer string instead of a single character?
=end

def ascii_value(string)
  sum = 0
  string.each_char {|char| sum += char.ord}
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration:

"a".ord.chr == "a"
"waffle".ord.chr == "w"