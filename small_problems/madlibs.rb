=begin
Mad libs are a simple game where you create a story template with blanks for words.
You, or another player, then construct a list of words and place them into the story,
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
and an adjective and injects those into a story that you create.
=end

def prompt(type)
  puts "Please enter a #{type}"
end

types = ["noun", "verb", "adjective", "adverb"]
responses = []

types.each do |type|
  prompt(type)
  responses << gets.chomp
end

puts "Johnny #{responses[3]} stole a #{responses[0]} from his #{responses[2]} neighbor, and then ran away to #{responses[1]} with his friends"

