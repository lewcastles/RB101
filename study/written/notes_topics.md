

## RB101 - Syntactical Sugar in Ruby & Local Variable Scoping Rules


### Intro to Syntactical Sugar in Ruby
We will come across sutiations where the syntatical sugar that allows ruby to read fluently can also 'hide' some of the clarity behind what the code is doing. For example early on in Ruby, we find that because parenthesis are optional when invoking a method the follow issue can arise:

`puts "hello"` is equivalent to `puts("hello")`. Can cause confusion where you cannot tell if a method or a local variable is being referenced. Example:

```ruby
str = 'a string'

def str
  'a method'
end

p str 
# local variable takes 
# precidence prints 'a string'

p str() 
# explicitly requesting the method 
# by using brackets print 'a method'
```


### Where does the Code actually come from?
We can lookup key classes/methods in the Ruby documentation at: https://ruby-doc.org/

'Core' library classes/methods are loaded at runtime we have access to these at any time without any extra work. It consists of the most commonly used methods.

'Standard' library classes/methods are useful but not used as often and are segregated to prevent the language from bloat. We need to `require` classes from standard to make them available, to use the `prime?` method from the `Prime` class in the Standard library we can:
```ruby
require 'prime'

def is_prime?(num)
  num.prime?
end

p is_prime?(5) # prints true
```
**External** libraries are known as **'gems'** the gems must first be installed using `gem install XXXX' then required in the same way as the standard library.

Important to understand that there is always an answers to these questions as you advance your knowledge more depth is revealed.

**The price we pay for a seemingly easy to read syntax is that there is more complexity hidden behind it.**

### Local Variable Scope

> A local variable declared in a method or within a loop cannot be accessed outside of that loop or method.

>Generally, the scope of a local variable is one of
>1. proc{ ... }
>2. loop{ ... }
>3. def ... end
>4. class ... end
>5. module ... end
>6. the entire program (unless one of the above applies)

We refer to the 'block' this loop or method encapsulates as the 'Inner Scope' and the code outside of the block as 'Outer Scope'

Important to pay attention to this in Ruby as there is no specfic key to differentiate between initialization and assignment.

### Local Variable Shadowing
>When we have local variable(s) in an **inner scope with same name as another variable or method in outer scope**. It is said that **the variable defined in the inner scope "shadows" the one in the outer scope** (because the outer variable is now no longer accessible as long as the inner variable is in scope, even though it would otherwise be in scope).

A case can be made for giving variables in inner scope unique and clear names to avoid the confusion this situation can create.

#### Optional Parenthesis - Example 1:
```ruby
def number
  2
end
puts number
```
**Outputs `2` with return value of `nil`**


`lines 1-3` define a method that returns the integer value 2. `line 4` then invokes the puts method and passes the return value from the method number as its arguement. This program will . This example demonstrates the fact that brackets are paranthesis are optional for methods and that `line 4` is in fact passing the return from a method rather than a variable.

#### Variable Scoping Rules - Example 1:

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```
The local variable `greeting` is initialized and assigned the string `'Hello'` on `line 1`. The loop method is invoked and passed the block (delimited by the do..end on `lines 3-6`) as its argument. Inside the block the string 'Hi' is reassigned to `greeting` on `line 4`. On line 8 we invoke the `puts` method and pass in `greeting` as its argument. This will print 'Hi' and return `nil`. This example is demonstrating local variable scoping rules, specfically that a local variable initialized in the outer scope is accessable from the inner scope (inside the block).

#### Variable Scoping Rules - Example 2:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
puts number
```
We define a method `add_two` with one parameter `number` on `lines 1-3`. When this method is invoked we take `number` add 2 and return the new value. 

On `line 5` we invoke the puts method to which we pass the return value from invoking the method `add_two` with an argument of 3. This will print 5 and return nil.

On `line 6` we invoke the puts method and pass `number` as its argument. This will output an error.

This example is demonstrating local variable scoping rules specfically that a local variable initialized inside the inner scope (inside the method definition of `add_two`) cannot be accessed from the outer scope (outside of the method).

#### Variable Scoping Rules - Example 3:

```ruby
number = 1

def add_to(number)
  number + 2
end

puts add_to(3)
```

`line 1` initializes the local variable `number` to an integer value of `1`.

`lines 3-5` defines a method `add_to` that takes one parameter `number` and returns `number` plus 2.

On `line 7` we invoke the `add_to` method, and pass an integer `3` as its arguement. `add_to` returns then integer `5` we then pass this to the puts method as its arguement and the program outputs `5` with a return value of `nil`.

This example demonstrates local variable scoping rules. `number` on `line 1` cannot be accessed from within the inner scope of the `add_to` method. `line 1` is an unused assignment in thie example. 


#### Variable Shadowing - Example 1:

```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

```
