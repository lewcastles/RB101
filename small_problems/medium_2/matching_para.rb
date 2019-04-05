def balanced?(str)
  para_arr = str.scan(/[()]/)
  para_arr.each_with_index do |outer, outeridx|
    next unless outer == '('

    para_arr[outeridx..para_arr.size - 1].each_with_index do |inner, inneridx|
      next unless inner == ')'

      para_arr[outeridx] = 'R'
      para_arr[inneridx + outeridx] = 'R'
      break
    end
  end
  para_arr.count(')').zero? && para_arr.count('(').zero?
end
  
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
