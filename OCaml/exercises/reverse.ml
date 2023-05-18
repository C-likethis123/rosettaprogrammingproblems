(* Reverse a list! *)

let rev = function
| [] -> []
| x :: tail -> rev tail @ [x];;

(* Better *)
# let rev list =
  let rec aux acc = function
    | [] -> acc
    | h :: t -> aux (h :: acc) t
  in
  aux [] list;;
