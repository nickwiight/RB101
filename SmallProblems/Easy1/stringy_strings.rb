# def stringy(number, start = 1)
#   numbers = []
#   # number.times { |x| numbers.push(x.even? ? '1' : '0') }
#   number.times do |x|
#     if x.even?
#       numbers.push(start == 1 ? 1 : 0)
#     else
#       numbers.push(start == 1 ? 0 : 1)
#     end
#   end
#   numbers.join
# end

def stringy(number, start = 1)
  first = (start == 0 ? '0' : '1')
  second = (start == 0 ? '1' : '0')
  result = ''
  number.times { |x| result << (x.even? ? first : second)}
  result
end

puts stringy(6, 0)
puts stringy(9, 5)
puts stringy(4)
puts stringy(7)
