def vowel?(str)
  'AEIOUaeiou'.include?(str)
end

def select_vowels(str)
  selected = ''
  counter = 0
  loop do
    break if counter == str.length

    if vowel?(str[counter])
      selected << str[counter]
    else
      'nein'
    end
    counter += 1
  end
  selected
end

p select_vowels('EfgcccIOlewis')