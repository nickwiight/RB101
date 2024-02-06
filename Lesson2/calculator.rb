OPERATOR_PROMPT = <<~MSG
  Which operation should be used?
  1) addition
  2) subraction
  3) multiplication
  4) division
MSG

def prompt(message)
  puts ">> #{message}"
end

def valid_number
  num = 0
  loop do
    prompt 'Enter a number:'
    num = gets.chomp.to_i
    break if num != 0

    prompt 'Not a valid number. Try again.'
  end
  num
end

def valid_operation
  operation = 0
  prompt OPERATOR_PROMPT
  loop do
    operation = gets.chomp.to_i
    break unless %w[1 2 3 4].include? operation

    prompt 'You must choose 1, 2, 3, or 4'
  end
  operation
end

def operation_to_message(op)
  case op
  when 1 then 'Adding'
  when 2 then 'Subracting'
  when 3 then 'Multiplying'
  when 4 then 'Dividing'
  end
end

prompt 'Welcome to calculator'

loop do
  x = valid_number
  y = valid_number

  operation = valid_operation

  result = case operation
           when 1 then x + y
           when 2 then x - y
           when 3 then x * y
           when 4 then x * 1.0 / y
           end

  prompt "#{operation_to_message(operation)} the two numbers..."
  prompt "Result: #{result}"

  prompt 'Do you want to perform another calculation? (Y to calculate again)'
  break unless gets.chomp.downcase.start_with?('y')
end

prompt 'Thank you for using caluclator. Goodbye!'
