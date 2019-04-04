def fibonaccilast(n)
  lastno = [1, 1]
  (3..n).each do |n|
    lastno = [lastno.last, (lastno.first + lastno.last) % 10]
  end
  lastno[1]
end

p fibonaccilast(1_000_007)