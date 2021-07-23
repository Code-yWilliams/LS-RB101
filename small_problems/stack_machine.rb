=begin
Write a method that implements a miniature stack-and-register-based programming
language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the
result in the register. 
SUB Pops a value from the stack and subtracts it fromthe register value,
storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value,
storing the result in the register.
DIV Pops a value from the stack and divides it into the register value,
storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value,
storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

Further Exploration:
Try writing a minilang program to evaluate and print the result of this expression:

(3 + (4 * 5) - 7) / (5 % 3)
=end

def minilang(string)
  stack = []
  register = 0
  inputs = string.split(" ")

  inputs.each do |input|
    case
    when input.to_i.to_s == input
      register = input.to_i
    when input == "PUSH"
      stack << register.dup
    when input == "ADD"
      register = register + stack.pop
    when input == "SUB"
      register = register - stack.pop
    when input == "MULT"
      register = register * stack.pop
    when input == "DIV"
      register = register / stack.pop
    when input == "MOD"
      register = register % stack.pop
    when input == "POP"
      register = stack.pop
    when input == "PRINT"
      puts register
    else 
      puts "unrecognized command!"
    end
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration:
minilang("3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT SUB PUSH 3 ADD DIV PRINT")

