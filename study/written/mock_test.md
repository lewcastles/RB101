# Mock Test Examples

A bunch of code snippets to analyze. None of them has any description, but most demonstrate one specific concept from _RB101_. I would normally copy 5–10 into a separate doc in Boostnote, and describe them there.

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
puts number
```

```ruby
def number
  2
end
puts number
```

```ruby
number = 1

def add_to(number)
  number + 2
end

puts add_to(3)
```

```ruby
def a_method
  puts "hello world"
end
```

```ruby
num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end
```

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
```

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

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1
arr2
```

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2
arr1
```

```ruby
def some_method(a)
  puts a
end

some_method(5)
```

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

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

```ruby
def some_method
  a = 1
  5.times do
    puts a
    b = 2
  end

  puts a
  puts b
end

some_method
```

```ruby
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
```

```ruby
USERNAME = 'Batman'

def authenticate
  puts "Logging in #{USERNAME}"
end

authenticate
```

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

```ruby
loop do
  MY_TEAM = "Phoenix Suns"
  break
end

puts MY_TEAM
```

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

```ruby
str = 'How do you get to Carnegie Hall?'
arr = str.split
arr.join
```

```ruby
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end

long.to_h
short.to_h
```

```ruby
[1, 2, 3].each { |num| puts num }
```

```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr
```

```ruby
def greetings(str)
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

```ruby
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
```

```ruby
def add_name(arr, name)
  arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect 
```

```ruby
arr = [3, 'd', nil]
arr[2] # => nil
arr[3]
```

```ruby
loop do
  b = 1
  break
end

puts b
```

```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)
```

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

```ruby
a = 1

loop do
  puts a
  a = a + 1
  break
end

puts a 
```

```ruby
def greetings
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end
```

```ruby
n = 10

[1, 2, 3].each do |n|
  puts n
end
```

```ruby
def greetings
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end
```

```ruby
if false
  puts 'hi'
else
  puts 'goodbye'
end
```

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

```ruby
a = 'hi'

def some_method
  puts a
end

some_method
```

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names.inspect 
```

```ruby
a = 1

loop do
  b = 2

  loop do
    c = 3
    puts a
    puts b
    puts c
    break
  end

  puts a
  puts b
  puts c
  break
end

puts a
puts b
puts c
```

```ruby
def change_name(name)
  name = 'severus'
end

name = 'ron'
change_name(name)
puts name
```

```ruby
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
numbers.delete(1)
```

```ruby
def cap(str)
  str.capitalize!
end

name = "harry"
cap(name)
puts name
```

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

```ruby
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
```

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

```ruby
if false
  greeting = “hello world”
end

greeting
```

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
```

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

```ruby
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

select_letter(question, 'a').size
select_letter(question, 't').size
select_letter(question, 'z').size
```

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

```ruby
str = 'abcdefghi'

str[2]
```

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
```

```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]
```

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```