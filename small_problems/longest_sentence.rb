=begin
Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end
with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending
characters should be treated as a word. You should also print the
number of words in the longest sentence.
=end
=begin
def longest_sentence(string)
  new_string = string.gsub(/[!?.]/, "=")
  sentences = new_string.split("=").map { |sentence| sentence.split(" ")}
  longest_sentence = sentences[0]
  sentences.each { |sentence| longest_sentence = sentence if sentence.size >= longest_sentence.size}
  puts "The longest sentence is:"
  puts longest_sentence.join(" ")
  puts "It is #{longest_sentence.count} words long."
end
=end

text = File.read(text_file.txt)

def longest_sentence(string)
  longest = []
  sentences = string.split(/\.|\?|!/).map { |sentence| sentence.split(" ") }.each do |sentence|
    longest = sentence if sentence.size >= longest.size
  end
  longest
end

def print_longest(string)
  puts "The longest sentence is:"
  puts "\"#{longest_sentence(string).join(" ")}\""
  puts "It is #{longest_sentence(string).size} words long."
end

print_longest(text)

#NOTE: can also use .maxby to find the maximum value by array size (word length)

=begin
Further Exploration:
To find longest word, just split the text file using a " " delimiter.
Then use .maxyby to select the word with the largest size.

To find the longest paragraph, split the text up using a \n\n delimiter
(splits up the text where ruby finds 2 new lines)