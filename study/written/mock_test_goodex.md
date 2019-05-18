# Mock Test #2

```ruby
num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end
```

This example will output `small number` and the return value of the `if` statement will be `nil`.

On line 1, the local variable `num` is initialized and assigned to the Integer `5`.

On lines 3–7, there’s an `if` statement, with a _test expression_ `(num < 10)`. `num` evaluates to `5`, and `(5 < 10)` evaluates to the Boolean value `true`. The _then_ expression on line 4 is thus evaluated.

On line 4, the method `puts` is invoked with a String `small number` passed in as an argument. `small number` is output and `nil` is returned.


```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

This examples demonstrates collection transformation, and how the return value of block is used by a method.

On line 1, there’s a method invocation to the `map` method. `map` is called on the Array object `[1, 2, 3]`. The `do..end` block alongside the `map` invocation is part of the invocation, and is passed to the method.

The `do..end` block defined on lines 1–7 takes a block parameter `num`, which is assigned to by `map` each time the block is executed. In this case `num` represents each consecutive Array element.

On line 2, `num > 1` is evaluated. If it evaluates to `true`, the the return value of the method invocation becomes the element of the Array that will be returned by `map` — and `puts` always returns `nil`. If `num > 1` evaluates to `false`, then the current value of `num` will be the return value of the `if` statement, and thus the return value of the block, which `map` will then use as the value of the current Array element it is building.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
```
This examples demonstrates how a collection can be sorted, and how the sorting rules can be modified by defining a `do..end` block alongside the `sort` method invocation.

On line 1, the method `sort` is called on the Array `[2, 5, 3, 4, 1]`. `sort` then uses the `do..end` block on lines 1–3 to sort the Array. The block takes two parameters, `a` and `b`, which represent two consecutive elements inside the array each time the block is executed.

On line 2, `b` and `a` are compared using `<=>`. `<=>` is a method called on `b`, and `a` is passed in as an argument. `<=>` returns `-1`, `0`, or `1` depending on the result of the comparison. In this case, the elements will be sorted in descending order and the return value of the `sort` method will be `[5, 4, 3, 2, 1]`.

```ruby
def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end
```
This example demonstrates the selection of elements from a collection, and specifically the method definition for `select_vowels`, which takes a paramater `str` and builds up a a String `select_chars` which will include all the vowels from `str` and will become the implicit return value of the method.

On line 1, the method definition of `select_vowels` starts with the `def` keyword, and it ends on line 17 with the `end` keyword. `str` is method parameter that will be assigned to the object referenced by the argument passed into the method when it is invoked.

On line 2, the local variable `selected_chars` is assigned to an empty String. On line 3 the local variable `counter` is assigned to `0`.

On line 5 the method `loop` is invoked and the `do..end` block on lines 5–14 is passed to it.

Every time the block executes, a consecutive character of `str` is assigned to a local variable `current_char`. If that character is included in the string `aeiouAEIOU` (which represents vowels), then the value of `current_char` is appended to `selected_chars`. This means that the value of the object referenced by `selected_chars` is modified, making `<<` a destructive method.

The loop executes until all characters in `str` are analyzed, and then on line 16 `selected_chars` is returned.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1
arr2
```
This examples demonstrates how variables are pointers to objects, how objects can be copied in a _shallow_ way, and how destructive methods can affect different local variables in unexpected ways.

On line 7, the expression `arr1` will evaluate to `['a', 'b', 'c']`, and on line 8 `arr2` will evaluate to `['A', 'B', 'C']`.

On line 3 the method invocation to `map!` takes a `do..end` block defined on lines 3–5. The block transforms the `arr2` Array in place, reassigning each element to the return value of the method invocation expression `char.upcase`, where `char` is a block parameter representing each consecutive element of `arr2`. 

`upcase` is a method that returns a new String object, and all the elements of `arr2` are pointing at new objects at this point. Before the `map!` invocation all of the elements in `arr1` and `arr2` were pointing at the same objects. But even though `map!` modifies an Array’s elements in place, `char.upcase` returns a new String, and that string becomes the new `arr2` element each time the block iterates.


```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2
arr1
```

This examples demonstrates how 


```ruby
def some_method(a)
  puts a
end

some_method(5)
```
This example demonstrates how a method definition can gain access to local variables outside of the method definition’s scope by defining method parameters. It also shows an example of a method invocation on line 5.

On line 1 the method definition of the method named `some_method` begins with the `def` keyword, and ends on line 3 with the `end` keyword. The method defines a parameter `a` (in parenthes following the method name), and line 2 constitutes the method body. The last expression evaluated will become the return value for the method, which in this case is the only expression on line 2.

On line 5 the method `some_method` is invoked and an Integer `5` is passed to it as a method argument.

When the method is invoked, the method parameter `a` is assigned to the value `5`. Then, on line 2, the method `puts` is invoked and `a` is passed to it. `puts` outputs a String representation of `5` and returns the value `nil`. That `nil` value then becomes the return value of `some_method`.


```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << current_element + 's'   # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements
```
This example demonstrates collection transformation, specifically transforming an Array destructively, in place.

The expression `transformed_elements` on line 14 will evaluate to `['apples', 'bananas', 'pears']`.

On line 1 a local variable `fruits` is initialized and assigned to an Array `['apple', 'banana', 'pear']`.

On line 2 a local variable `transformed_elements` is initialized and assigned to an empty Array. On line 3 a local variable `counter` is assigned to `0`.

On line 5 the method `loop` is invoked, and a block is passed to it. The block will execute as many times as there are elements in `fruits` — every time the block executes, `counter` is incremented and then compared to the size of the `fruits` Array.

Within each iteration of `loop`, the result of concatenating the value of `current_element` and the String `s` is appended to `transformed_elements` with `<<`.

Then `transformed_elements` on line 14 evaluates to `['apples', 'bananas', 'pears']`.


```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end

# => ?
```
This example demonstrates collection transformation and selection.

The method invocation to `map` on line 1 is an example of transformation, and the call to `select` is an example of selection.

On line 1 the method `map` is invoked on the Array `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]`. `map` takes a block defined by `do..end` on lines 1–9. The block takes a parameter `arr`, which will be assigned to each of the two nested arrays inside `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]` in each consecutive block execution.

In each block iteration, the return value of the block will become the value of the element appended to the Array that will be returned by `map`. So for each element of the Array on which `map` is called, there will be another, transformed, element.

The transformed Array will have two elements, just as the object it’s called on. Each element of the array will be the return value of calling `select` on the block parameter `arr` inside the block.

The method `select` also takes a block, and then evaluates the return value of the block in a Boolean way to determine whether each `item` should be selected as part of the Array that will be returned by `select`.

Inside the block passed to `select`, each `item` is first evaluated to check whether it’s an Integer or not. If it is, only `item`s greater than 13 will become part of the return value of `select`. The `item`s that are not Integers (in this example that means they’re String objects), only `item`s whose `size` is less than `6` will become part of the returned array.

At the end, the return value of calling `map` will be `[[13, 27], ['apple']]`.


```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

The return value of the method invocation `arr.sort_by` will be `[['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]`.

On line 1, the local variable `arr` is initialized and assigned to the Array `[['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]`.

On line 3, the method `sort_by` is called on `arr`, and the block delimited by a `do..end` keyword pair on lines 3–7 is passed to it. The block takes one parameter named `sub_arr`.

`sort_by` will sort the object it is called on using the key returned by the block passed to it. In this case, it will be the return value of calling `map` on `sub_arr` each time the block executes.

`sub_arr` will be assigned to `['1', '8', '11']` in the first iteration. Then, `map` will be called on it, and a transformed array returned by `map` will become the key by which `sort_by` will sort the object it was called on. The `map` call here will return an Array in which each element it converted to an Integer with `to_i`, rather than a String.

`sort_by` will thus return a new Array sorted using the result of that `map` call, which looks at Integer elements of each nested Array. The rules for sorting Arrays include comparing elements one by one with `<=>`.