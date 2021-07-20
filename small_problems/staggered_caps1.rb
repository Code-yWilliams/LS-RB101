=begin
Write a method that takes a String as an argument, and returns a new String
that contains the original value using a staggered capitalization scheme
in which every other character is capitalized, and the remaining characters
are lowercase. Characters that are not letters should not be changed,
but count as characters when switching between upper and lowercase.

Further Exploration:
Can you modify this method so the caller can request that the first character
be downcased rather than upcased? If the first character is downcased,
then the second character should be upcased, and so on.
=end

LETTERS = ("a".."z").to_a + ("A".."Z").to_a

def staggered_case(string, which_cap = "first")
  result = ""
  chars = string.split("")
  if which_cap == "first"
    chars.each_with_index do |char, index|
      if index.even? && LETTERS.include?(char)
        result << char.upcase
      elsif index.odd? && LETTERS.include?(char)
        result << char.downcase
      else
        result << char
      end
    end
  elsif which_cap == "second"
    chars.each_with_index do |char, index|
      if index.even? && LETTERS.include?(char)
        result << char.downcase
      elsif index.odd? && LETTERS.include?(char)
        result << char.upcase
      else
        result << char
      end
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case("get in loser, we're going shopping", "second")