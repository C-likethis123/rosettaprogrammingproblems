let rec last lst =
  match lst with
  | [] -> None
  | x::[] -> Some x
  | _::y -> last y;;

(* Better - avoid match keyword with function *)
let rec lst = function
| [] -> None
| [x] -> Some x
| _ :: t -> last t;;