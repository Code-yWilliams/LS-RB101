=begin
Write a method that takes a string as an argument, and returns
true if all parentheses in the string are properly balanced,
false otherwise. To be properly balanced, parentheses must
occur in matching '(' and ')' pairs.
')' and '(' is not a matching pair because they aren't in order

Further Exploration:
There are a few other characters that should be matching as well.
Square brackets and curly brackets normally come in pairs.
Quotation marks(single and double) also typically come in pairs
and should be balanced. Can you expand this method to
take into account those characters?
=end

def balanced?(string)
  opening_paren = 0
  closing_paren = 0
  opening_square_bracket = 0
  closing_square_bracket = 0
  opening_curly_bracket = 0
  closing_curly_bracket = 0
  quote = 0

  string.chars.each do |char|
    if char == "("
      opening_paren += 1
    elsif char == ")"
      closing_paren += 1
    elsif char  == "["
      opening_square_bracket += 1
    elsif char == "]"
      closing_square_bracket += 1
    elsif char == "{"
      opening_curly_bracket += 1
    elsif char == "}"
      closing_curly_bracket += 1
    elsif char == "\""
      quote += 1
    end
    return false if opening_paren < closing_paren
    return false if opening_square_bracket < closing_square_bracket
    return false if opening_curly_bracket < closing_curly_bracket
  end
  return false if opening_paren - closing_paren != 0
  return false if opening_square_bracket - closing_square_bracket != 0
  return false if opening_curly_bracket - closing_curly_bracket != 0
  return false if quote.odd?
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false


# Further Exploration:
p balanced?("(Hi) [I'm] {Cody} \" \"")