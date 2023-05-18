(* An option is used to express that a value might or might not be present *)
(* Some and None are constructors that let you build optional values*)
let divide x y =
  if y = 0 then None else Some (x / y);;

(* use pattern matching for options *)
(* ^ for concatenating strings *)
(* In OCaml there is no NullPointerException, options are used to encode a value that might not be there. In Ocaml, missing values are explicit *)
let downcase_extension filename =
  match String.rsplit2 filename ~on:'.' with
  | None -> filename
  | Some (base,ext) -> base ^ "." ^ String.lowercase ext;;

