def triangle(deg1, deg2, deg3)
  angles = [deg1, deg2, deg3]

  if angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.max < 90
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
