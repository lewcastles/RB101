## Specific Definitions


### Logic / Control Flow
* Truthiness - be very clear about the distinction between truthy and the boolean `true`, falsey and boolean `false`. **In Ruby, every value apart from false and nil, evaluates to true or is truthy conversely false and nil evaluate to false or are considered falsey**
* Block - Represented by `do..end` in Ruby

### Proceedure
* Transformation
* Selection

### Variables
Accessible
* Variable - A symbolic name or alias for an object, by convention variables are used where they are expected to reference more than one value
* Constant - A symbolic name or alias for an object that is not expected to change where it is pointing.
* Initialized - First time you assign certain value to some local variable you are initializing it.
* Assigning/assignment - Assign an object to a symbolic name(variable/constant).
* Reassigned/reassignment - Reset a symbolic name(variable/constant) to point at a different object.
* Referencing - Symbolic Names(variables/constants) reference the objects which are assigned to them.
* Pointer/Pointing - Interchangable with referencing.
* Shadowing

```ruby
# initializing local variable a then assigning string object 'hello' to local variable a
# conversely local variable a can be said to reference string object 'hello'
a = 'hello' 

# initializing local variable b then to which we assign the object being referenced by 
# local variable a, in this case the string object 'hello'
b = a

# reassigning the string object 'goodbye' to local variable a
a = 'goodbye'
```



### Methods
* Method Definition / Defining a method - Where we setup and define the edges of Method
* Method Invocation
* Method Call
* Receiver
* Parameters 
  >Methods are defined with parameters, but they are called with arguments.
* Arguments
* Passing
  >passing in as an argument

### Objects

* Integer
* String
* Array
* Hash
* Syntactical sugar - A shorthand feature in a programming language that generally allows for easier comprehension of commonly performed tasks ex: `counter += 1` over `counter = counter + 1`



### Other
* Operator
* Test Expression
* Evaluation
* Destructive Method
* Append