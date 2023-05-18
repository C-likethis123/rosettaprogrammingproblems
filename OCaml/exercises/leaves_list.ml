(* Collect the leaves of a binary tree in a list *)
type a' tree = Empty | Node of 'a * 'a tree * 'a tree;

let leaves = function
| Empty -> []
| Node (_, Empty, Empty) -> [Node (_, Empty, Empty)]
| Node (_, left, right) -> leaves left @ leaves right;;

(* Better - preventing append *)
let leaves t = 
  let rec leaves_aux t acc = match t with
    | Empty -> acc
    | Node (x, Empty, Empty) -> x :: acc
    | Node (x, l, r) -> leaves_aux l (leaves_aux r acc)
  in
  leaves_aux t [];;
