=begin
Create a method that takes 2 arguments, an array and a hash.
The array will contain 2 or more elements that, when combined with adjoining spaces,
will produce a person's name. The hash will contain two keys,
:title and :occupation, and the appropriate values.
Your method should return a greeting that uses the person's full name,
and mentions the person's title and occupation.

Further Exploration:
This method doesn't actually pass rubocop! What is the best way to shorten
the lines in this method so it doesn't exceed the 80 maximum characters to a line?
=end

def greetings(name_array, info_hash)
  "Hello, #{name_array.join(" ")}. I hear that you are a 
  #{info_hash[:title]} #{info_hash[:occupation]}"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
