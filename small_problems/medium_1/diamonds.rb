def rowout(line, total)
  stars = '*' * line
  puts stars.center(total)
end

def diamond(diamond_height)
  midpoint = diamond_height / 2 + 1
  current_line = 1
  (1..diamond_height).each do |n|
    rowout(current_line, diamond_height)
    if n < midpoint
      current_line += 2
    else
      current_line -= 2
    end
  end
end

diamond(21)
