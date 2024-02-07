# Sum or Product of Consecutive Integers
def select_number
  num = 0
  loop do
    puts '>> Please enter an integer greater than 0:'
    num = gets.chomp.to_i

    break if num.positive?

    puts '>> invalid input. Try again.'
  end
  num
end

def select_operation
  operation = ''
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp
    break if %w[s p].include?(operation)

    puts '>> invaalid input. Try again.'
  end
  operation
end

num = select_number
operator = select_operation

# case operator
# when 's'
#   result = 0
#   num.times { |i| result += i + 1 }
#   puts "The sum of the integers between 1 and #{num} is #{result}."
# when 'p'
#   result = 1
#   num.times { |i| result *= i + 1 }
#   puts "The product of the integers between 1 and #{num} is #{result}."
# end

# Further Exploration
case operator
when 's'
  puts "The sum of the integers between 1 and #{num} is #{(1..num).inject(:+)}"
when 'p'
  puts "The product of the integers between 1 and #{num} is #{(1..num).inject(:*)}"
end
