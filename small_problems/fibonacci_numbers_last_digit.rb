=begin
compute a method that returns the last digit of the nth Fibonacci number.

Further Exploration:
After a while, even this method starts to take too long to compute results.
Can you provide a solution to this problem that will work no matter how big the number?
You should be able to return results almost instantly.
For example, the 123,456,789,987,745th Fibonacci number ends in 5.
=end

def fib_last(n)
  n = n % 60 # Further Exploration (last fib digit repeats every 60 fib numbers)
  fibonacci = [1, 1]
  (n-2).times { fibonacci = [ (fibonacci[1] % 10), (fibonacci[0] + fibonacci[1]) % 10 ] }
  fibonacci.last
end

p fib_last(123456789)

# Further Exploration Alternative:

def fib_last(num)
  '011235831459437077415617853819099875279651673033695493257291'[num%60]
end


