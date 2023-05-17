(* An option is used to express that a value might or might not be present *)
(* Some and None are constructors that let you build optional values*)
let divide x y =
  if y = 0 then None else Some (x / y);;