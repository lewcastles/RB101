def joinor(arr, delim = ',', word = 'or')
  arr.map.with_index do |element, idx|
    case idx
    when 0 then element.to_s
    when arr.size - 1 then " #{word} #{element}"
    else "#{delim} #{element}"
    end
  end.join
end
