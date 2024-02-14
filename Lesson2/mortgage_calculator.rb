require 'yaml'

MESSAGES = YAML.load_file 'mortgage_calculator_messages.yml'

def loan_info_from_user
  display_personalized_or_generic_message('loan_amount', NAME)
  loan = number_input_from_user
  display_personalized_or_generic_message('apr_amount', NAME)
  apr = number_input_from_user
  display_personalized_or_generic_message('loan_duration', NAME)
  duration_in_years = number_input_from_user

  return loan, apr, duration_in_years
end

def name_from_user
  display_message 'enter_name'
  name = ''
  loop do
    name = gets.chomp
    if name == ''
      display_message 'generalized'
    else
      display_message('your_name', name)
    end
    break if confirmation?

    display_message 'enter_name'
  end
  name
end

def calculate_monthly_payment(loan, apr, duration_in_years)
  mpr = (apr / (100.0 * 12))
  duration_in_months = duration_in_years * 12
  monthly_payment = (loan *
    (mpr / (1 - ((1 + mpr)**(-duration_in_months))))).round(2)

  return mpr, monthly_payment
end

def display_monthly_payment(mpr, monthly_payment)
  clear_screen
  display_personalized_or_generic_message('monthly_breakdown', NAME)
  sleep 1
  display_message('monthly_interest', (mpr * 100).round(3))
  sleep 1
  display_message('monthly_payment', monthly_payment)
  sleep 1
end

def number?(string)
  string.to_i.to_s == string || string.to_f.to_s == string
end

def not_negative?(string)
  string.to_f.positive?
end

def number_input_from_user
  input = ''
  loop do
    input = gets.chomp
    break if valid_number_input?(input)

    display_message 'positive_number'
  end
  input.to_f
end

def valid_number_input?(input)
  number?(input) && not_negative?(input)
end

def clear_screen
  system 'clear'
end

def confirmation?
  input = ''
  loop do
    input = gets.chomp
    break if valid_confirmation_input? input

    display_message 'invalid_confirmation'
  end

  input.start_with? 'y'
end

def valid_confirmation_input?(string)
  (string.start_with? 'y') || (string.start_with? 'n')
end

def display_personalized_or_generic_message(key, *args)
  key += '_generic' if NAME.empty?
  display_message(key, *args)
end

def display_message(key, *args)
  prompt(message(key, *args))
end

def message(key, *args)
  args.empty? ? MESSAGES[key] : MESSAGES[key] % args
end

def prompt(message)
  puts ">> #{message}"
end

clear_screen
display_message 'welcome'
NAME = name_from_user
display_personalized_or_generic_message('thanks_name', NAME)

loop do
  clear_screen
  loan, apr, years = loan_info_from_user
  mpr, monthly_payment = calculate_monthly_payment(loan, apr, years)
  display_monthly_payment(mpr, monthly_payment)

  display_personalized_or_generic_message('calculate_another', NAME)
  break unless confirmation?
end

clear_screen
display_message 'thanks'
display_personalized_or_generic_message('goodbye', NAME)
