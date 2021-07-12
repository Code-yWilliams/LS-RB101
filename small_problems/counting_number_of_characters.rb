=begin
Write a program that will ask a user for an input of a word
or multiple words and give back the number of characters.
Spaces should not be counted as a character.
=end

def prompt(message)
  puts "--> #{message}"
end

prompt("Please write a word or multiple words")
input = gets.chomp

character_count = input.delete(" ").size

puts "There are #{character_count} characters in \"#{input}\"."