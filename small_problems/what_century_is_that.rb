=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.
=end

def century(year)
  century = (year / 100) + 1
  century -= 1 if (century % 100 == 0)
  suffix(century)
end

def suffix(century)
  return century.to_s + "th" if [11, 12, 13].include?(century % 100)
  last_digit = century.to_i % 10
  case last_digit
    when 1 then century.to_s + "st"
    when 2 then century.to_s + "nd"
    when 3 then century.to_s + "rd"
    else century.to_s + "th"
  end
end

puts century(2000) #== '20th'
puts century(2001) #== '21st'
puts century(1965) #== '20th'
puts century(256) #== '3rd'
puts century(5) #== '1st'
puts century(10103) #== '102nd'
puts century(1052) #== '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'
  
      
