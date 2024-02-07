# Tip Calculator

puts 'Enter a bill amount:'
bill = gets.chomp.to_f
puts 'Enter a tip percentage:'
tip_percent = gets.chomp.to_f
tip = (bill * (tip_percent / 100)).round(2)
total = (bill + tip).round(2)

formatted_tip = format('%.2f', tip)
formatted_total = format('%.2f', total)

puts "The tip is $#{formatted_tip}"
puts "The total is $#{formatted_total}"
