(* Find the nth element of a list. It raises an exception if the index is out of bounds *)

let rec nth lst n =
  match lst with
  | [] -> None (* should throw error here*)
  | x::tail -> if n = 0 then x else nth tail (n - 1);;

(* Better - function matches on the argument given *)
let rec nth n = function
| [] -> None
| h :: t -> if k = 0 then Some h else at (k - 1) t;;