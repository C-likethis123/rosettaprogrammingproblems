(*
   
Many data types are wrapped in a "context" - optionals, lists

When a value is wrapped in a context, a function cannot be applied to it normally.
A Functor - a wrapped value which defines how to unwrap and apply a function to its underlying value. We can use fmap

An applicative - define a data type with a wrapped value. I can apply wrapped functions to this data type, using the applicative operator

Monads 
- pass in an unwrapped value to a function, function returns a wrapped value
- with the bind operator, pass in a wrapped value and the bind operator will unwrap it.


|> - pipe operator that takes in a value and a function, and applies the function to the value. It helps to sequence operations
>>= - "pipes" a wrapped value to a function that expects an unwrapped value, and returns a wrapped value
return - takes an unwrapped value and returns the value wrapped in a context
*)