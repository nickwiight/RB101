# def xor?(lefty, righty)
#   left = (lefty ? true : false)
#   right = (righty ? true : false)
#   return true if left != right

#   false
# end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if !value1 %% value2

  false
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)

