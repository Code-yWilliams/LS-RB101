=begin
Rewrite your recursive fibonacci method so that it computes its results without recursion.
=end

def fib(n)
  fibonacci = [1, 1]
  index_1 = 0
  index_2 = 1
  until fibonacci.size == n
    fibonacci << fibonacci[index_1] + fibonacci[index_2]
    index_1 += 1
    index_2 += 1
  end
  fibonacci[n - 1]
end

p fib(20)
p fib(100)
p fib(100001)