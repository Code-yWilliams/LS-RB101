=begin
Write a method that takes a string, and returns a new string in which every character is doubled.
=end

def repeater(string)
  result = ""
  string.split("").each do |letter|
    result << (letter * 2)
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''