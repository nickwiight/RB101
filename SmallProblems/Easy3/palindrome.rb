# Works for strings and arrays
def palindrome?(input)
  input == input.reverse
end

puts palindrome? 'madam'
puts palindrome? 'Madam'
puts palindrome? "madam i'm adam"
puts palindrome? '356653'
puts palindrome? [1, 2, 2, 1]
puts palindrome? [1, 2, 1, 1]
