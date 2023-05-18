(* Elements of a list can be accessed through pattern matching *)
(* OCaml will warn you if the pattern matching is not exhaustive - there are values that won't be captured by the pattern *)
  (* use a match expression *)
let my_favourite_language languages =
  match languages with
  | first :: the_rest -> first
  | [] -> "OCaml";;

  