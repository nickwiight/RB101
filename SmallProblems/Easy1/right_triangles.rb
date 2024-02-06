# Initial Solution
# def triangle(num)
#   num.times { |i| puts ('*' * (i + 1)).rjust(num)}
# end

# Further Explorations

def triangle(num, flip_h = false, flip_v = false)
  star_count = flip_v ? num : 1
  num.times do 
    if flip_h
      puts ('*' * star_count).ljust(num)
      star_count += flip_v ? -1 : 1
    else
      puts ('*' * star_count).rjust(num)
      star_count += flip_v ? -1 : 1
    end
  end
end

triangle 8
triangle 8, true, false
triangle 8, false, true
triangle 8, true, true
