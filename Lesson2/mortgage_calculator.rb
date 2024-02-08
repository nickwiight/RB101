def monthly_payment(loan, apr, duration)
  mpr = (apr / (100.0 * 12))
  months = duration * 12
  monthly_payment = (loan * (mpr / (1 - (1 + mpr)**-months))).round(2)

  prompt "Monthly interest rate: #{(mpr * 100).round(3)}"
  prompt "Loan duration in months: #{months.to_i}"
  prompt "Monthly payment: $#{monthly_payment}"
end

def prompt(message)
  puts ">> #{message}"
end

def number?(string)
  string.to_i.to_s == string || string.to_f.to_s == string
end

def not_negative(string)
  string.to_f.positive?
end

def valid_input(message)
  input = ''
  prompt message
  loop do
    input = gets.chomp
    break if number?(input) && not_negative(input)

    prompt 'You must enter a positive number. Try again.'
  end
  input.to_f
end

prompt 'Welcome to Mortgage Calculator'

loop do
  loan = valid_input('What is your loan amount?')
  apr = valid_input('What is your APR? (ex: 5.3 for 5.3%)')
  duration = valid_input('What is your loan duration in years?')
  monthly_payment(loan, apr, duration)

  prompt 'Would you like to calculate another mortgage? (Y to continue)'
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt 'Thank you for using Mortgage Calculator.'
prompt 'Goodbye!'
