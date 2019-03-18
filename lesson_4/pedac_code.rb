def substrings(str)
  arr = []
  start_idx = 0
  while start_idx < str.length - 1
    end_idx = start_idx + 1
    while end_idx < str.length
      arr.push(str[start_idx..end_idx]) if ispalindrome?(str[start_idx..end_idx])
      end_idx += 1
    end
    start_idx += 1
  end
  arr
end

def ispalindrome?(str)
  str == str.reverse
end

puts substrings('abba')
