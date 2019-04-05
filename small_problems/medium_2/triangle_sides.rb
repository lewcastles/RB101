def triangle(l1, l2, l3)
  sides = [l1, l2, l3]
  long_side = sides.max
  case
  when sides.include?(0) || 2 * long_side > l1 + l2 + l3
    :invalid
  when l1 == l2 && l2 == l3
    :equilateral
  when l1 == l2 || l2 == l3 || l1 == l3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
