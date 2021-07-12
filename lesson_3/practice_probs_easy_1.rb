# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
p advice


# Programmatically determine if 42 lies between 10 and 100.
 p (10...100).include?(42)
 # or
 p (10...100).cover?(42)


# Starting with the string:
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it:
p "Four score and " << famous_words
p famous_words.prepend("Four score and ")


# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:
# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
p flintstones.flatten!


# Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number
p flintstones.assoc("Barney")
