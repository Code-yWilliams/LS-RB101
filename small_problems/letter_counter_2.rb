=begin
Modify the word_sizes method from the previous exercise
to exclude non-letters when determining word size.
For instance, the length of "it's" is 3, not 4.
=end

VALID_CHARS = ("a".."z").to_a + ("A".."Z").to_a + [" "]

def valid_char(string)
  string = string.split("").delete_if do |char|
    !VALID_CHARS.include?(char)
  end
  string.join("")
end

def word_sizes(string)
  counts = {}
  string = valid_char(string)
  string.split(" ").each do |word|
    counts[word.size] ||= 0
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}