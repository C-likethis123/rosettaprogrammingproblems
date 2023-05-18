(* Find the last two elements of a list *)

let rec last_two = function
| [] -> None
| [x] -> None
| [first;second] -> Some [first;second]
| _ ::t -> last_two t;;

(* Better *)
let rec last_two = function
| [] | [_] -> None (* bunch more than one function *)
| [first;second] -> Some (first,second)
| _::t -> last_two t;;
