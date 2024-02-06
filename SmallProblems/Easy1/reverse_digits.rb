# Initial Solution
# @param num [Integer]
# def reversed_number(num)
#   array = num.digits
#   array.shift until array[0] != 0
#   array.join.to_i
# end

# Optimized Solution knowing #to_i trims leading zeroes off
def reversed_number(num)
  num.digits.join.to_i
end

puts reversed_number 12345
puts reversed_number 12213
puts reversed_number 456 
puts reversed_number 12000
puts reversed_number 12003
puts reversed_number 1
