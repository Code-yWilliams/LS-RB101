=begin
Write a method that takes a time using this minute-based format
and returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.
You may not use ruby's Date and Time classes.

Further Exploration:
Problem 1: try normalizing the negative minuntes using the % operator

Problem 2: How do you approach the problem using Date and Time classes?

Problem 3: How do you solve this using Date and Time, and factor in day of the week?
=end

MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def normalize(minutes)
  until minutes > 0
    minutes += MIN_PER_DAY
  end
  minutes % MIN_PER_DAY
end

def time_of_day(minutes)
  hours, mins = normalize(minutes).divmod(MIN_PER_HR)
  format("%02d:%02d", hours, mins)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# Further Exploration:
# Problem 1:
