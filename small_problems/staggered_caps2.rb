=begin
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

Further Exploration:
Modify this method so the caller can determine whether non-alphabetic characters
should be counted when determining the upper/lowercase state. 
That is, you want a method that can perform the same actions that this method does,
or operates like the previous version.
=end


def staggered_case(string, count_nons = false)
  LETTERS = ("a".."z").to_a + ("A".."Z").to_a
  if count_nons
    result = []
    chars = string.split("")
      chars.each_with_index do |char, index|
        if index.even? && LETTERS.include?(char)
          result << char.upcase
        elsif index.odd? && LETTERS.include?(char)
          result << char.downcase
        else
          result << char
        end
      result
    end

  else
    index_counter = 0
    letter_counter = 0
    result = []
    chars = string.split("")
    until index_counter > string.size do
      if letter_counter.even? && LETTERS.include?(chars[index_counter])
        result << chars[index_counter].upcase
        index_counter += 1
        letter_counter += 1
      elsif letter_counter.odd? && LETTERS.include?(chars[index_counter])
        result << chars[index_counter].downcase
        index_counter += 1
        letter_counter += 1
      else
        result << chars[index_counter]
        index_counter += 1
      end
    end
  end

  result.join("")
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration:
p staggered_case("I love Launch School", true)