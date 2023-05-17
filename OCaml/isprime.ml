open Base
open Stdio

(* using floats *)
let ratio x y =
  Float.of_int x /. Float.of_int y;;

  printf "Ratio: %F\n" (ratio 4 7)

(* use Float internally, avoid awkward float operator *)
let ratio2 x y =
  let open Float.O in
  of_int x / of_int y;;

(* more concise syntax *)
let ratio3 x y =
  Float.O.(of_int x / of_int y);;

(* conditionals *)
let sum_if_true test first second = 
  (if test first then first else 0)
  + (if test second then second else 0);;

 (* should be a comment? use = for equality *)
let even x = x % 2 = 0;;

let () =
  printf "Total: %d\n" (sum_if_true even 2 6)