HEX = {10 => 'a', 11 => 'b', 12 => 'c', 13 => 'd', 14 => 'e', 15 => 'f'}

def rhs(n)
  output = ''
  n.times do |_|
    int = rand(15)
    output << if int > 9
                HEX[int]
              else
                int.to_s
              end
  end
  output
end

p "#{rhs(8)}-#{rhs(4)}-#{rhs(4)}-#{rhs(4)}-#{rhs(12)}"


