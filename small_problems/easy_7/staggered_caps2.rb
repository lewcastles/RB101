def staggered_case(str)
  new_str = ''
  tog = false
  str.chars.each do |char|
    tog = !tog if char =~ /[A-z]/
    new_str << if tog
                 char.upcase
               else
                 char.downcase
               end
  end
  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'