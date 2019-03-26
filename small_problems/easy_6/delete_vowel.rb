def remove_vowels(arr)
  output = []
  arr.each do |value|
    output << value.gsub(/[aeiou]/i, '')
  end
  output
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']