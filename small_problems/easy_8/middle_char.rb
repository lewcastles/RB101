def center_of(str)
  midpointrd = str.length / 2
  if str.length.even?
    str[midpointrd - 1..midpointrd]
  else
    str[midpointrd]
  end
end
    





p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'