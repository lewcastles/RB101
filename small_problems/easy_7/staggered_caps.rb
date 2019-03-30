def staggered_case(str)
  new_str = ""
  str.chars.each.with_index do |char, idx|
    if idx.odd?
      new_str << char.downcase
    else
      new_str << char.upcase
    end
  end
  new_str
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'