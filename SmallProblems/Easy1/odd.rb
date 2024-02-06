# def odd(integer)
#   integer % 2 != 0
# end

def odd(integer)
  integer.remainder(2) != 0
end

puts odd(2)
puts odd(5)
puts odd(-17)
puts odd(-8)
puts odd(0)
puts odd(7)
