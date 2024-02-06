# Initial Solution

# def center_of(string)
#   leng = string.length
#   half = leng / 2
#   half * 2 == leng ? string[half - 1] + string[half] : string[half]
# end

# Optimized Solution

def center_of(string)
  half = string.length / 2
  half * 2 == string.length ? string[half - 1, 2] : string[half]
end

p center_of 'I love ruby'
p center_of 'Launch School'
p center_of 'Launch'
p center_of 'Launchschool'
p center_of 'x'
