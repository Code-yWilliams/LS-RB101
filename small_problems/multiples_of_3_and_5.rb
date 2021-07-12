=begin
Write a method that searches for all multiples of 3 or 5
that lie between 1 and some other number, and then computes
the sum of those multiples. For instance, if the supplied
number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
You may assume that the number passed in is an integer greater than 1.

Further Exploration:
Investigate Enumerable.inject (also known as Enumerable.reduce),
How might this method be useful in solving this problem?
(Note that Enumerable methods are available when working with Arrays.)
Try writing such a solution. Which is clearer? Which is more succinct?
=end

def multisum(number)
  sum = 0
  (1..number).each do |num|
    if num % 3 == 0 || num % 5 == 0
      sum += num
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# Further Exploration

def multiple_sum(number)
  (1..number).inject(0) do |sum, num|
    num % 3 == 3 || num % 5 == 0 ? sum + num : nil
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# note: could also use select to create an array of values that are multiples of 3 or 5. Then use .sum on that array to find the sum

