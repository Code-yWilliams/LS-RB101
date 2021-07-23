=begin
Write a recursive method that computes the nth Fibonacci number,
where n is an argument to the method.
=end

def fib(n)
  return 1 if (n <= 2)
  fib(n - 2) + fib(n-1)
end

p fib(1) == 1
p fib(2) == 1
p fib(3) == 2
p fib(4) == 3
p fib(5) == 5
p fib(12) == 144
p fib(20) == 6765
