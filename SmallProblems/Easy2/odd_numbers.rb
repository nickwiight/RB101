# 100.times { |i| puts i if i.odd? }
# 1..99.times { |i| puts i + 1 if i.even? }

#Further Exploration
# 0.upto(99) { |i| puts i + 1 if i.even? }
Array(1..99).select(&:odd?).each { |i| puts i }
