=begin
write a one-line program that creates the following output 10 times,
with the subsequent line indented 1 space to the right:
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end
message = "The Flintstones Rock!"
10.times do 
  puts message
  message.insert(0, " ")
end
# or 
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


=begin
The result of the following statement will be an error:
  puts "the value of 40 + 2 is " + (40 + 2)
what are two possible ways to fix this?
=end
puts "the value of 40 + 2 is " + "#{40 + 2}"
# or
puts "the value of 40 + 2 is " + (40 + 2).to_s


=begin
Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

Alyssa noticed that this will fail if the input is 0, or a negative number,
and asked Alan to change the loop. How can you make this work without using
begin/end/until? Note that we're not looking to find the factors for 0 or
negative numbers, but we just want to handle it gracefully instead of
raising an exception or going into an infinite loop.
=end
def factors(number)
  divisor = number
  factors = []
  factors << 0 if divisor == 0
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors.flatten
end

p factors(0)


=begin
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the
sequence until some limit is reached.
Ben coded up this implementation but complained that as soon as he ran it,
he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

=end
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 100)
puts "result is #{result}"

