def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

p string_lengths("I hate cheese")