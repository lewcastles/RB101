def letter_percentages(str)
  ratio = {lowercase: 0, uppercase: 0, neither: 0}
  total = 0
  str.chars.each do |char|
    if char =~ /[a-z]/
      ratio[:lowercase] += 1
    elsif char =~ /[A-Z]/
      ratio[:uppercase] += 1
    else
      ratio[:neither] += 1
    end
    total += 1
  end
  ratio[:lowercase] = ratio[:lowercase]* 100.to_f / total
  ratio[:uppercase] = ratio[:uppercase]* 100.to_f / total
  ratio[:neither] = ratio[:neither]* 100.to_f / total
  ratio
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }