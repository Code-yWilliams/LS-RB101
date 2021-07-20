LOWS = ("a".."z")
HIGHS = ("A".."Z")

def word_cap3(string)
  result_array = []
  words = string.split(" ")
  words.each do |word|
    letters = word.split("")
    first_letter = letters.shift
    if LOWS.include?(first_letter) && word == words[0]
      first_letter = (first_letter.ord - 32).chr
    end
    letters.each do |letter|
      if HIGHS.include?(letter)
        letter = (letter.ord + 32).chr
      end
    end
    letters.prepend(first_letter)
    letters = letters.join("")
    letters
    result_array << letters
  end
  result_array.join(" ")
end

puts word_cap3("i love bagels")