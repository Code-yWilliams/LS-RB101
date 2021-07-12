=begin
Write a method that takes a floating point number
that represents an angle between 0 and 360 degrees
and returns a String that represents that angle in
degrees, minutes and seconds.
You should use a degree symbol (°) to represent degrees,
a single quote (') to represent minutes,
and a double quote (") to represent seconds.
A degree has 60 minutes, while a minute has 60 seconds.

Further exploration:
Since degrees are normally restricted to the range 0-360,
can you modify the code so it returns a value in the appropriate
range when the input is less than 0 or greater than 360?
=end

DEG = "\xC2\xB0"

def dms(number)
  degree = number.floor
  minute = ((number - degree.to_f) * 60).round(4)
  mins = "%02d" % minute
  second = ((((number - degree.to_f) * 60).round(4) - minute) * 60).floor
  secs = "%02d" % second
  return "#{degree}#{DEG}#{mins}'#{secs}\""
end


puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration:
def normalize(number)
  if number < 0
    until number >= 0
      number += 360
    end
    return number
  elsif number > 360
    until number <= 360
      number -= 360
    end
    return number
  else
    return number
  end
end

# Then set number = normalize(number) within the dms function above

=begin

def dms(number)
  number = normalize(number)
  degree = number.floor
  minute = ((number - degree.to_f) * 60).round(4)
  mins = "%02d" % minute
  second = ((((number - degree.to_f) * 60).round(4) - minute) * 60).floor
  secs = "%02d" % second
  return "#{degree}#{DEG}#{mins}'#{secs}\""
end

=end