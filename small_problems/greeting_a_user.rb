=begin
Write a program that will ask for user's name. 
The program will then greet the user. 
If the user writes "name!" then the computer yells back to the user.
=end

puts "What's your name?"
user_name = gets.chomp
user_name_array = user_name.split("")

if user_name_array.pop == "!"
  puts "HELLO, #{user_name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello, #{user_name}"
end

# OR (with .chop!)

puts 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# OR (with .chomp!)

puts 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name.chomp!("!")
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
