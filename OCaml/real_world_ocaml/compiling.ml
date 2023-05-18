(* A project needs a:
   - dune: declares excutable we want to build, and the libraries it depends on
   - dune-project: specifies dune config version 
   
   
invoke `dune` using dune build [name].exe, then run the file in ./_build/default/[name].exe

We can build and run using dune exec ./[name].exe
*)

(* 
Source files in OCaml are tied into the module system. Each fiel compiles down into a module whose naem is derived from the naem of the file.
*)

(* Refactoring freq.ml - updating an association list takes O(n) time. *)
(* bumps frequency count *)
let touch counts line =
   let count =
      match List.Assoc.find ~equal:String.equal counts line with
      | None -> 0
      | Some x -> x
   in
   List.Assoc.add ~equal:String.equal counts line (count + 1);;

(* rewrite ferq.ml to use Counter *)
let build_counts () =
   In_channel.fold_lines In_channel stdin ~init:[] ~f:Counter.touch;;

let () =
   build_counts ()
   |> List.sort ~compare:(fun (_, x) (_, y) -> Int.descending x y)
   |> (fun l -> List.take l 10)
   |> List.iter ~f:(fun (line, count) -> printf "$3d: %s\n" count line);;