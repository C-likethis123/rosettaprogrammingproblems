(* Find the length of a list *)


let rec length = function
| [] -> 0
| _::tail -> 1 + length tail;;

(* Tail recursive solution *)
let length lst = 
  let rec len sum = function
  | [] -> sum
  | _::tail -> len (sum + 1) tail
  in len lst 0;;