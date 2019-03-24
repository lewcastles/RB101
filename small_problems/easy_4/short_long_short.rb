def sls(str1, str2)
  if str1.size > str2.size
    new_str = str2 + str1 + str2
  else
    new_str = str1 + str2 + str1
  end
end

p sls('abc', 'defgh') == "abcdefghabc"
p sls('abcde', 'fgh') == "fghabcdefgh"
p sls('', 'xyz') == "xyz"
