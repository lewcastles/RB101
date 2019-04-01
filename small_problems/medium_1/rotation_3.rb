def rotate_array(arr)
  arr.push(arr.shift)
end

def rotate_rightmost_digits(number, no_to_reverse)
  digit_array = number.digits.reverse
  rotate_this = rotate_array(digit_array.pop(no_to_reverse))
  digit_array.concat(rotate_this).join.to_i
end

def max_rotation(int)
  int.digits.size.step(1, -1) do |idx|
    int = rotate_rightmost_digits(int, idx)
  end
  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845