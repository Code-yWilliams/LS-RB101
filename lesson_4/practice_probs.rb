# Additional Practice

# Given the array below:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the
# values are the positions in the array.

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash


# Add up all of the ages from  the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
"Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each_value do |value|
  sum += value
end
p sum


# In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Remove people with age 100 or greater

ages.each do |key, value|
  ages.delete(key) if (value >= 100)
end
p ages


# Pick out the minimum age from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
"Marilyn" => 22, "Spot" => 237 }

lowest_age = ages.first
ages.each do |name, age|
  if age <= lowest_age[1]
    lowest_age = [name, age]
  else
    next
  end
end

p lowest_age
#OR
ages.values.min


# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"
be = flintstones.select do |element|
  element[0, 2] == "Be"
end
p flintstones.index(be.join)

# OR
flintstones.index { |name| name[0, 2] == "Be" }


# Amend this array so that the names are shortened to just the first
# three characters
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
fli = flintstones.map {|name| name.split("").first(3).join}
p fli

# OR
flintstones.map! {|name| name[0, 3]}


# Create a hash that expresses the frequency with which each letter occurs
# in this string:
statement = "The Flintstones Rock"
letter_count = {}
letters = statement.downcase.delete(" ").chars.uniq
letters.each do |letter|
  letter_count[letter] = statement.downcase.count(letter)
end
p letter_count


# Ruby on rails has a titleize method that capitalizes the first letter
# of every word in a string. Write your own version of the titleize implementation
words = "the flintstones rock"

def titleize(string)
  string.split(" ").each {|word| word.capitalize!}.join(" ")
end

p titleize(words)

# OR
words.split.map { |word| word.capitalize }.join(' ')


# Given the Munsters hash below:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash so that each member of the Munster family has an
# additional 'age group' key that has one of three values describing
# the age group the family member is in (kid, adult, senior)

Kid = (0..17)
Adult = (18..64)
Senior =  (65..300)

munsters.each do |name, info|
  if Kid.include?(info["age"])
    value["age_group"] = "kid"
  elsif Adult.include?(info["age"])
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

puts munsters

# OR
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
