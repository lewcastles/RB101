=begin
11:32
Your goal is to implement an difference function, which subtracts one list from another.
It should remove all values from list a, which are present in list b.
array_diff([1,2],[1]) == [2]
# If a value is present in b, all of its occurrences must be removed from the other:

# array_diff([1,2],[1]) == [2]

input: arr1, arr2
output: arr3

algo:
iterate through elements in A
  B.delete_if element == A elements
return A



=end

def array_diff(arr1, arr2)
  arr2.each do |element_a|
    arr1.delete_if {|element_b| element_a == element_b}
  end
  arr1
end

p array_diff([1, 2, 5, 6],[1, 5])

# 7 min