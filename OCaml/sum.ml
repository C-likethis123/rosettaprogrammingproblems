open Base
open Stdio

(* input_line reads lines one by one from a standard input *)
let rec read_and_accumulate accum =
  let line = In_channel.input_line In_channel.stdin in
  match line with
  | None -> accum
  | Some x -> read_and_accumulate (accum +. Float.of_string x);;

let () =
  printf "Total: %F\n" (read_and_accumulate 0.)