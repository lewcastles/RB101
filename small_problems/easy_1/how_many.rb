vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  arr.uniq.each do |element|
    puts "#{element} => #{arr.count(element)}"
  end
end

count_occurrences(vehicles)
