
def century(year)
  if year %100 == 0
    century = year / 100
  else
    century = year / 100 + 1
  end
  
  if year.to_s[-2] == "1"
    output = "#{century}th"
  else
    output = case century.to_s[-1]
             when '1'
               "#{century}st"
             when '2'
               "#{century}nd"
             when '3'
               "#{century}rd"
             else
               "#{century}th"
             end
  end
  output
end

p century(1900)