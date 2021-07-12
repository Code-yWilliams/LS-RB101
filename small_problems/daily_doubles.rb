=begin
Write a method that takes a string argument and returns
a new string that contains the value of the original
string with all consecutive duplicate characters
collapsed into a single character.
You may not use String#squeeze or String#squeeze!.
=end

def crunch(string)
  result = ""
  string.chars.each do |char|
    result << char unless result[-1] == char
  end
  result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# OR

def crunchh(str)
  str.split('').each_with_object('') { |chr, str| str << chr if str[-1] != chr }
end