def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

# Further Exploration
def power(base, power)
  result = 1
  power.times { |_| result = multiply(result, base)}
  result
end

# p multiply([1, 2], 5)
# p [1, 2] + [1, 2]

puts square(5)
puts square(-8)

puts power(10, 2)
puts power(10, 0)
puts power 2, 4
