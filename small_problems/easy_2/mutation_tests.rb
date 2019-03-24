expense1 = {type: travelling, amount: 500}

def travelling_expenses_total(expenses)
  expenses
    .select{ |e| e.type == :travelling }
    .map(&:amount)
    .reduce(0, :+)
end

travelling_expenses_total(expense1)