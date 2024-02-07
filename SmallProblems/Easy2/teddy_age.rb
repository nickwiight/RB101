# How old is Teddy?

def teddy_age(name = 'Teddy')
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

teddy_age
teddy_age
teddy_age('Bob')
teddy_age('Sally')
