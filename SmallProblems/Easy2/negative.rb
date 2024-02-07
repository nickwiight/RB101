# Always Return Negative

# def negative(num)
#   # num *= -1 if num.positive?
#   # num
#   # I forgot ternarys!
#   num.positive? ? -num : num
# end

# this may not be better than the ternary because it always performs an operation,
# unlike the ternary, which only performs an operation if the right condition is met.
def negative(num)
  -num.abs
end

puts negative 5
puts negative -3
puts negative 0
