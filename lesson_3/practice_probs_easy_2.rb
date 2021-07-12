# In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.
p ages.select {|key, value| key == "Spot" || value == "Spot"}
# Bonus: What are two other hash methods that would work just as well for this solution?
p ages.has_key?("Spot")
p ages.include?("Spot")


# Starting with this string:
munsters_description = "The Munsters are creepy in a good way."
=begin
Convert the string in the following ways (code will be executed on original munsters_description above):
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
=end
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase


# We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages


# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")
# or 
p advice.match?("Dino")


# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << "Dino"
# or 
p flintstones.concat(["Dino"])
# or
p flintstones.push("Dino")


# How can we add multiple items to our array? (Dino and Hoppy)
flintstones << "Dino" << "Hoppy"
# or 
flintstones += ["Dino", "Hoppy"]


# Shorten the following sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# use .slice! to return "Few things in life are as important as "
# but leave the advice variable as "house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice


# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
p statement.count("t")


=begin
Back in the stone age (before CSS) we used spaces to align things on the screen.
If we had a table of Flintstone family members that was forty characters in width,
how could we easily center that title above the table with spaces?
=end
title = "Flintstone Family Members"
p title.center(40, ".")
