def featured(num)
  to_check = num
  loop do
    to_check += 1
    next unless to_check.odd? && (to_check % 7).zero? && to_check.digits == to_check.digits.uniq

    return to_check
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987


