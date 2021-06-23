# ask the user for two numbers
# as the user for an operation to perform on the two numbers
# perform the operation on the two numbers
# output the result

require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message="", lang="en")
  MESSAGES[lang][message]
end

# initializing variables because otherwise, they are only local to their loops
first_number = nil
second_number = nil
operator = nil
name = ""

# creating a method that adds => before messages for visual clarity
def prompt(message)
  puts "=> #{message}"
end

# creating a method to make sure that the input is a valid number
# it allows for 0 to be a valid number
def valid_number?(int)
  if int.to_i == 0 && (int != "0" || int != 0.0)
    false
  elsif int.to_i.to_s == int || int.to_f.to_s == int
    true
  end
end

# creating method to make sure the operator is one of the available options
def valid_operator?(operator)
  if (1..4).member?(operator.to_i)
    # OR if operator == "1" || operator == "2" || operator == "3" || operator == "4"
    true
  else
    false
  end
end

# creating method to return string confirming the requested operation
def operation_message(op)
  word = case op
         when '1'
           '+...'
         when '2'
           '-...'
         when '3'
           '*...'
         when '4'
           '/...'
         end
  x = "waffle" # this is a random line; save case to a variable and return it when case is not the last evaluated line
  word
end

prompt(messages("welcome", "fr"))
# prompt(messages("welcome"))
prompt(messages("get_name", "fr"))
# prompt(messages("get_name"))
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages("invalid_name", "fr"))
  else
    prompt(messages("greeting", "fr") + "#{name}")
    # prompt(messages("greeting") + "#{name}")
    break
  end
end

# main loop / will repeat if user wants to perform another cal @ end
loop do
  loop do
    prompt(messages("get_first_number", "fr"))
    # prompt(messages("get_first_numer"))
    first_number = gets.chomp

    if valid_number?(first_number)
      break
    else
      prompt(messages("invalid_number", "fr"))
      # prompt(messages("invalid_number"))
    end
  end
  loop do
    prompt(messages("get_second_number", "fr"))
    # prompt(messages("get_second_number"))
    second_number = gets.chomp

    if valid_number?(second_number)
      break
    else
      prompt(messages("invalid_number", "fr"))
      # prompt(messages("invalid_number"))
    end
  end

  prompt(messages("get_operator", "fr"))
  # prompt(messages("get_operator"))

  loop do
    operator = gets.chomp
    if valid_operator?(operator)
      prompt("#{operation_message(operator)}")
      break
    else
      prompt(messages("invalid_operator", "fr"))
      # prompt(messages("invalid_operator"))
    end
  end

  result = case operator
           when "1"
             first_number.to_f + second_number.to_f
           when "2"
             first_number.to_f - second_number.to_f
           when "3"
             first_number.to_f * second_number.to_f
           when "4"
             first_number.to_f / second_number.to_f
           end

  prompt("Le résultat est #{result}")
  # prompt("The result is #{result}")
  prompt(messages("repeat", "fr"))
  # prompt(messages("repeat"))
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y') || repeat.downcase.start_with?('o')
end
prompt("Merci d'avoir utilisé Calculatrice, #{name}.")
# prompt("Thanks for using Calculator, #{name}.")
