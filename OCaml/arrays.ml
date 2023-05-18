(* Arrays are similar to arrays in other languages - indexing starts at 0. access/modify is O(1) *)
(* Use unit for the return value of an operation like setting a mutable field. *)
(* Records can have some of their fields explicitly declared as mutable. *)
(* Records, which are immutable by default, can have some of their fields explicitly declared as mutable. *)

type running_sum = {
  mutable sum: float;
}
(* In imperative code, we need to use single semicolons to sequence operations *)
