(* Read lines from stdin, print out 10 most frequent lines *)

open Base;;
open Stdio;;

let assoc = [("one", 1); ("two",2); ("three",3)];;
(* List.Assoc Provides functions for interacting with lists of key/value pairs *)

let counter () =
  In_channel.fold_lines In_channel.stdin ~init:[] ~f:Counter.touch;;

(* OCaml has no main function. All statements are evaluated in the order in which they are linked together *)
let () =
    counter ()
    |> List.sort ~compare:(fun (_, x) (_, y) -> Int.descending x y)
    |> (fun l -> List.take l 10)
    |> List.iter ~f:(fun (line, count) -> printf "%3d: %s\n" count line);;
