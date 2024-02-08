def prompt(message)
  puts ">> #{message}"
end

def number_input(position, array)
  prompt "Enter the #{position} number"
  array.push (gets.chomp.to_i)
end

numbers = []
number_input 'first', numbers
number_input 'second', numbers
number_input 'third', numbers
number_input 'fourth', numbers
number_input 'fifth', numbers
prompt 'Enter the last number'
last = gets.chomp.to_i

if numbers.include? last
  prompt "The number #{last} appears in #{numbers}."
else
  prompt "The number #{last} does not appear in #{numbers}."
end
