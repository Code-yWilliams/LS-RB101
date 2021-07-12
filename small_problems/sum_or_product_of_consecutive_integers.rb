=begin
Write a program that asks the user to enter an integer greater
than 0, then asks if the user wants to determine the sum
or product of all numbers between 1 and the entered integer.

Further exploration:
The compute_sum and compute_product methods are simple and
should be familiar. A more rubyish way of computing sums and
products is with the Enumerable#inject method.
#inject is a very useful method, but if you've never used it
before, it can be difficult to understand.
=end

def consecutive_sum(int)
  total = 0
  0.step(int, 1) do |num| 
    total += num
  end
  total
end

def consecutive_product(int)
  total = 1
  1.step(int, 1) do |num|
    total *= num
  end
  total
end

calculation = ""
integer = 0

loop do
  
  puts "I can add or multiply consecutive integers between 1 and any integer!"

  loop do # integer validation loop
    puts "Please enter an integer greater than 0"
    integer = gets.chomp
    if integer.to_i.to_s == integer && integer.to_i.positive?
      break
    else
      puts "Hmm...that's not a valid integer. Try again."
    end
  end

  loop do #operation validation loop
    puts "Please enter 's' to compute the sum, or 'p' to compute the product"
    calculation = gets.chomp.downcase
    if calculation == "s" || calculation == "p"
      break
    else
      puts "Hmm...that's not a valid operation. Try again."
    end
  end


  if calculation == "s"
    puts "The sum of the integers between 1 and #{integer} is #{consecutive_sum(integer.to_i)}"
    break
  elsif calculation == "p"
    puts "The product of the integers between 1 and #{integer} is #{consecutive_product(integer.to_i)}"
    break
  else 
    puts "Hmm...that's not a valid operation..."
  end

  puts "Would you like to perform another calculation?"
  repeat = gets.chomp.downcase
  break unless repeat.start_with?("y")

end

# Further Exploration (using .inject)

def consec_sum(int)
  (0..int).inject do |sum, num|
    sum + num
  end
end

def consec_prod(int)
  (1..int).inject do |product, num|
    product * num
  end
end

loop do

puts "I can add or multiply consecutive integers between 1 and any integer!"

  loop do # integer validation loop
    puts "Please enter an integer greater than 0"
    integer = gets.chomp
    if integer.to_i.to_s == integer && integer.to_i.positive?
      break
    else
      puts "Hmm...that's not a valid integer. Try again."
    end
  end

  loop do #operation validation loop
    puts "Please enter 's' to compute the sum, or 'p' to compute the product"
    calculation = gets.chomp.downcase
    if calculation == "s" || calculation == "p"
      break
    else
      puts "Hmm...that's not a valid operation. Try again."
    end
  end

  if calculation == "s"
    puts "The sum of the integers between 1 and #{integer} is #{consec_sum(integer.to_i)}"
    break
  elsif calculation == "p"
    puts "The product of the integers between 1 and #{integer} is #{consec_prod(integer.to_i)}"
    break
  else 
    puts "Hmm...that's not a valid operation..."
  end

  puts "Would you like to perform another operation?"
  repeat_2 = gets.chomp.downcase
  break unless repeat_2.start_with?("y")
end