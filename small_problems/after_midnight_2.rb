=begin
Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.
=end


HRS_PER_DAY = 24
MIN_PER_HR = 60
MIN_PER_DAY = HRS_PER_DAY * MIN_PER_HR #1440

def hour_and_minute(str_time)
  str_time.split(":").map(&:to_i)
end

def after_midnight(str_time)
  hour, minute = hour_and_minute(str_time)
  ((hour * MIN_PER_HR) + minute) % MIN_PER_DAY
end

def before_midnight(str_time)
  (1440 - after_midnight(str_time)) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0