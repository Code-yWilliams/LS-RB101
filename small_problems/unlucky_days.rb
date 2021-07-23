=begin
Write a method that returns the number of Friday the 13ths in the year
given by an argument. You may assume that the year is greater than 1752
(when the United Kingdom adopted the modern Gregorian Calendar) and
that it will remain in use for the foreseeable future.

Further Exploration:
An interesting variation on this problem is to count the number of months
that have five Fridays. This one is harder than it sounds since you must account for leap years.
=end

def friday_13th(year)
  friday13 = 0
  month = 1
  1.upto(12) do |mo|
    t = Time.new(year, mo, 13)
    friday13 += 1 if t.friday?
    month += 1
  end
  friday13
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration:

require "date"

Months = {
  1 => "January", 2 => "February", 3 => "March", 4=> "April", 5 => "May", 6 => "June",
  7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"
}

def five_fri(year)
  result = []
  months = {}
  first_day = Date.new(year, 1, 1)
  last_day = Date.new(year, 12, 31)
  (first_day..last_day).each do |date|
    months[date.month] ||= 0
    months[date.month] += 1 if date.friday?
  end
  five_fris = months.select {|month, days| days == 5}
  five_fris.each_pair { |month, _| result << Months[month] }
  result
end

p five_fri(2021)