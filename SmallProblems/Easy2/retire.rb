
puts 'What is your age?'
age = gets.chomp.to_i
puts 'What age would you like to retire?'
retire_age = gets.chomp.to_i
retire_time = retire_age - age
year = Time.now.year

puts "It is #{year}. You will retire in #{year + retire_time}."
puts "You gave only #{retire_time} of work to go!"
