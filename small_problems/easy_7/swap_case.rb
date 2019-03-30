def swapcase(str)
  output = str.chars.map do |item|
    item =~ /[A-Z]/ ? item.downcase : item.upcase
  end
  output.join
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

