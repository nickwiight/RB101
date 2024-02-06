# First attempt

# def print_in_box(input)
#   width= input.length
#   puts "+-#{'-' * width}-+"
#   puts "| #{' ' * width} |"
#   puts "| #{input} |"
#   puts "| #{' ' * width} |"
#   puts "+-#{'-' * width}-+"
# end

# Further Exploration
COLUMNS = 76

#First attempt

# def get_lines(input)
#   lines = []
#   if input.length < COLUMNS
#     lines.push(input)
#   else
#     input.chars.each_slice(COLUMNS) { |slice| lines.push(slice) }
#     if lines.last.length < COLUMNS
#       (COLUMNS - lines.last.length).times { lines[lines.length - 1].push(' ') }
#     end
#   end
#   lines
# end

# def puts_lines(input)
#   lines = get_lines(input)
#   if lines[0].length < COLUMNS
#     puts "| #{lines[0]} |"
#   else
#     lines.length.times { |i| puts "| #{lines[i].join} |"}
#   end
# end

# def print_in_box(input)
#   width = input.length > COLUMNS ? COLUMNS : input.length
#   puts "+-#{'-' * width}-+"
#   puts "| #{' ' * width} |"
#   puts_lines(input)
#   puts "| #{' ' * width} |"
#   puts "+-#{'-' * width}-+"
# end

#Second attempt. Thanks, Zebulun Baukhagen for the inpiration.

def head(width)
  puts "+-#{'-' * width}-+"
  puts "| #{' ' * width} |"
end

def tail(width)
  puts "| #{' ' * width} |"
  puts "+-#{'-' * width}-+"
end

def print_in_box(input)
  width = input.length > COLUMNS ? COLUMNS : input.length
  lines = []
  input.chars.each_slice(COLUMNS) { |slice| lines.push(slice) }
  head(width)
  if lines.empty?
    puts "| #{input} |"
  else
    lines.length.times { |i| puts "| #{lines[i].join.center(COLUMNS)} |"}
  end
  tail(width)
end

print_in_box('To explore strange new worlds. To seek out new life and new civilizations. To boldy go where no one has gone before.')
print_in_box('')
