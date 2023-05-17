

(* printing utilities *)
let pp_int_pair ppf (x,y) =
  Caml.Format.fprintf ppf "(%d,%d)" x y
(* A tuple is an ordered collection of values that can each be a differnt type. Create a tuple by joining valuse together with a comma *)
let a_tuple = (3, 4);;

(* Pattern matching syntax *)
let (x, y) = a_tuple;;

(* Commas create a tuple even without surrounding parens, but this is considered bad style *)
let x = 1,2,3;;

let () =
  Caml.Format.printf "%a\n" pp_int_pair x;;
