def prompt(message)
  puts "--> #{message}"
end

loop do # main loop
  loan_amt_input = 0
  loan_amt = 0
  apr_input = 0
  apr = 0
  loan_durat_yrs_input = 0
  loan_durat_yrs = 0

  prompt("Welcome to loan calculator! Enter 'Quit' at any time to exit")

    loop do # loan amount validation loop
      prompt("What's your total loan amount?")
      loan_amt_input = gets.chomp
      if loan_amt_input.to_f.negative?
        prompt("Sorry, loan amount must be a positive value.")
      elsif loan_amt_input.to_f > 0
        break loan_amt = loan_amt_input.to_f
      elsif loan_amt_input == "quit" || loan_amt_input == "Quit"
        break loan_amt = "quit"
      else
        prompt("Sorry, that's an invalid loan amount...")
      end
    end

    break if loan_amt == "quit"

    loop do # apr validation loop
      prompt("What's your APR? (leave out the %)")
      prompt("Example: 5 for 5%, 26 for 26%")
      apr_input = gets.chomp
      apr = (apr_input.to_f) / 100
      if apr.negative?
        prompt("Sorry, apr must be a positive value.")
      elsif apr < 0.001 && (apr_input != "quit" && apr_input != "Quit")
        prompt("Hmmm...are you sure that's the apr? Try again.")
      elsif apr_input == "quit" || apr_input == "Quit"
        break apr = "quit"
      else
        break
      end
    end

    break if apr == "quit"

    loop do # loan duration validation loop
      prompt("What's the duration of the loan in years?")
      loan_durat_yrs_input = gets.chomp
      loan_durat_yrs = loan_durat_yrs_input.to_f
      if loan_durat_yrs <= 0.0 && (loan_durat_yrs_input != "quit" && loan_durat_yrs_input != "Quit")
        puts "Hmmm...try again."
      elsif loan_durat_yrs_input == "quit" || loan_durat_yrs_input == "Quit"
        break loan_durat_yrs = "quit"
      else
        break
      end
    end

  break if loan_durat_yrs == "quit"

  monthly_int = (apr / 12.0)
  loan_durat_months = (loan_durat_yrs * 12.0)

  monthly_payment = loan_amt * ((monthly_int * ((1 + monthly_int)**loan_durat_months)) / (((1 + monthly_int)**loan_durat_months) - 1))

  prompt("Your monthly payment is #{monthly_payment}")
  prompt("Do you want to calculate another loan?")
  repeater = gets.chomp
  break unless repeater.downcase.start_with?("y") || repeater.downcase.start_with?("q")
end

prompt("Thank you for using Loan Calculator...bye!")
