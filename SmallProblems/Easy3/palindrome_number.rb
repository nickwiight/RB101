def palindrommic_number(integer)
  integer.to_s == integer.to_s.reverse
end

puts palindrommic_number 34543
puts palindrommic_number 123210
puts palindrommic_number 22
puts palindrommic_number 5
