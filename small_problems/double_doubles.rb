def double_number?(num)
  digits = num.to_s.split("")
  first_half = digits[0..(((digits.size) / 2) - 1)]
  second_half = digits[((digits.size) / 2)..-1]
  (first_half == second_half) && (digits.size > 1)
end

def twice(num)
  double_number?(num) ? num : (num * 2)
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# OR
def double_num?(num)
  digits = num.to_s.chars
  half1, half2 = digits.partition.with_index { |_, idx| idx < digits.size / 2 }
  half1 == half2
end

def twice(num)
  double_num?(num) ? num : num * 2
end