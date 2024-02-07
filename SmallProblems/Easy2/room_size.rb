# How big is the room?

SQMETERS_TO_SQFEET = 10.7639
# puts 'Enter the length of the room in meters:'
# length = gets.chomp.to_f

# puts 'Enter the width of the room in meters:'
# width = gets.chomp.to_f

# square_m = (length * width).round(2)
# square_f = (square_m * SQMETERS_TO_SQFEET).round(2)
# puts "The area of the room is #{square_m} " + \
#      "square meters (#{square_f} square feet)."
SQFEET_TO_SQCENTIMETERS = 929.03304
puts 'Enter the length of the room in feet:'
length = gets.chomp.to_f

puts 'Enter the width of the room in feet:'
width = gets.chomp.to_f

square_f = (length * width).round(2)
square_i = (square_f * 12).round(2)
square_c = (square_f * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{square_f} square feet " + \
     "(#{square_i} square inches and #{square_c} square centimeters)"
