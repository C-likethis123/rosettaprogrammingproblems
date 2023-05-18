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

(* use List.iter to call a simple function on every element of a list, using a ref to accumulate results. *)

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

(* Pattern matching performance -
     it's not necessary to check each case in a `match` in sequence to figure out which one fires. 
     OCaml is often able to jump to machine code that jumps directly to the maatched case based on an efficiently chosen set of runtime checks.
     Match implementation is many times faster than the if-based implementation.
  *)

(* How to use the List Module effectively? *)
(* List.map2_exn takes two lists and a function for combining them, and throws an Exception if the lists are of mismatched length *)
List.map2_exn ~f:Int.max [1;2;3] [3;2;1];; (* [3;2;3]*)

(* List.fold takes three arguments - a list to process, an initial accumulator value, and a function for updating the accumulator. *)
List.fold ~init:0 ~f:(+) [1;2;3;4];;

(* comparing the maximum column widths *)
let max_widths header rows =
  let lengths l = List.map ~f:String.length l in
  List.fold rows
  ~init:(lengths header)
  ~f: (fun acc row -> 
       List.map2_exn ~f:Int.max acc (lengths row));;

(* 2. Write code to generate the line that separates the header from the rest of the text table.
   Use String.make over the lengths of the columns to generate a string of dashes.
   Then join the sequences using String.concat *)

let render_separator_widths =
  let pieces = List.map widths
    ~f:(fun w -> String.make w '-')
  in
  "|-" ^ String.concat ~sep:"-+-" pieces ^ "-|";;

(* String.concat vs ^:
   avoid ^ for joining large number of strings, since it allocates a new string everytime it runs
   String.concat works on a list of strings *)

(* pad a string to a specified length *)
let pad s length =
  s ^ String.make (length - String.length s) ' ';;
