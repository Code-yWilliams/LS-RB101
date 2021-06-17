=begin
Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. 
You may assume that the argument is a valid integer value.

def is_odd?(int)
  int.abs % 2 != 0
end

The Integer#remainder method performs a remainder operation in Ruby. 
Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.
=end

def is_odd?(int)
  int.abs.remainder(2) != 0
end

puts is_odd?(2)    
puts is_odd?(5)    
puts is_odd?(-17)  
puts is_odd?(-8)   
puts is_odd?(0)    
puts is_odd?(7) 
