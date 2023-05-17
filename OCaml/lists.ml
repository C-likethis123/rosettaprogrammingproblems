open Base
open Stdio

(* Lists - hold any number of items of the same type *)
let languages = ["OCaml";"Perl";"C"];;

(* mapping - the function is passed under a labelled argument ~f. Labelled arguments are specified by the name rather than by position, we can change the order in which it is presented*)
let lang_length = List.map languages ~f:String.length;;
(* this works too: List.map ~f:String.length languages *)

(* We can use the list constructor for adding elements in front of the list - this creates a new list, not mutate the existing one *)
let more_languages = "French" :: languages;;

(* [] is syntactic sugar for ::. :: is right associative *)

(* @ is a list concatenation operator *)
let concat = [1;2;3] @ [4;5;6];;
let () =
  printf "%d\n" (List.length languages);;