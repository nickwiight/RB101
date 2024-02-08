# Works for strings and arrays
def palindrome?(input)
  input == input.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome? string
end

puts real_palindrome? 'madam'
puts real_palindrome? 'Madam'
puts real_palindrome? "madam i'm adam"
puts real_palindrome? '356653'
puts real_palindrome? '356652'
# puts real_palindrome? [1, 2, 2, 1]
# puts real_palindrome? [1, 2, 1, 1]
