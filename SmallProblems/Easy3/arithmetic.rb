def prompt(message)
  puts ">> #{message}"
end

prompt 'Enter the first number:'
num1 = gets.chomp.to_i

prompt 'Enter the sencond number:'
num2 = gets.chomp.to_i

prompt "#{num1} + #{num2} = #{num1 + num2}"
prompt "#{num1} - #{num2} = #{num1 - num2}"
prompt "#{num1} * #{num2} = #{num1 * num2}"
prompt (num2 > 0 ? "#{num1} / #{num2} = #{num1 / num2}" : 'Cannot divide by 0')
prompt (num2 > 0 ? "#{num1} % #{num2} = #{num1 % num2}" : 'Cannot divide by 0')
prompt "#{num1} ** #{num2} = #{num1**num2}"
