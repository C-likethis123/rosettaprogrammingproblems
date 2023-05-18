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

(* use List.iter to call a simple function on every lement of a list, using a ref to accumulate results. *)

(* For and while loops *)
let permute array =
  let length = Array.length array in 
  for i = 0 to length - 2 in
    let j = i + Random.int (length - i) in
    let tmp = array.(i) in
    array.(i) <- array.(j);
    array.(j) <- tmp
  done;;

(* While loops - logical operators short circuits *)
let find_first_negative_entry array =
  let pos = ref 0 in
  while !pos < Array.length array && array.(!pos) >= 0 do
    pos := !pos + 1
  done;
  if !pos = Array.length array then None else Some !pos;;