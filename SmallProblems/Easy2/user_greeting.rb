# puts 'What is your name?'
# name = gets.chomp

# if name.end_with?('!')
#   puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name.capitalize}."
# end

# Further Exploration
puts 'What is your name?'
name = gets
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
