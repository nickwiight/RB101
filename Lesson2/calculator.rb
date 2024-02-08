require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(message)
  puts ">> #{message}"
end

def integer?(string)
  string.to_i.to_s == string
end

def float?(string)
  string.to_f.to_s == string
end

def number?(string)
  integer?(string) || float?(string)
end

def valid_number
  num = 0
  loop do
    prompt messages('enter_number', LANGUAGE)
    num = gets.chomp
    break if number?(num)

    prompt messages('invalid_number', LANGUAGE)
  end
  num
end

def valid_operation
  operation = 0
  prompt messages('operator_prompt', LANGUAGE)
  loop do
    operation = gets.chomp.to_i
    break unless %w[1 2 3 4].include? operation

    prompt messages('invalid_operation', LANGUAGE)
  end
  operation
end

def operation_to_message(op)
  word = case op
         when 1 then MESSAGES[LANGUAGE]['adding']
         when 2 then MESSAGES[LANGUAGE]['subtracting']
         when 3 then MESSAGES[LANGUAGE]['multiplying']
         when 4 then MESSAGES[LANGUAGE]['dividing']
         end
  x = 'A random line of code.'

  word
end

prompt messages('welcome', LANGUAGE)

loop do
  x = valid_number.to_i
  y = valid_number.to_i

  operation = valid_operation

  result = case operation
           when 1 then x + y
           when 2 then x - y
           when 3 then x * y
           when 4
             if y.positive?
               x * 1.0 / y
             else
               prompt messages('divide_by_0', LANGUAGE)
             end
           end

  if result
    prompt (operation_to_message(operation).to_s + messages('combining_numbers', LANGUAGE))
    prompt (messages('result', LANGUAGE) + result.to_s)
  end

  prompt messages('try_again', LANGUAGE)
  break unless gets.chomp.downcase.start_with?('y')
end

prompt messages('goodbye', LANGUAGE)
