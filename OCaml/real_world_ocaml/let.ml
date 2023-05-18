(* let bindings *)
(* A let paired with an in can be used to introduce a new binding within any local scope. *)
(* 
   Variables in OCaml are immutable. They act more like variables in an equation rather than variables in an imperative language.
  *)

  (* Pattern matching: let bindings supports the use of patterns on the left hand side.  *)
let z = 7 in
(* z + z;; scope fo let binding is terminated by double semicolon *)
