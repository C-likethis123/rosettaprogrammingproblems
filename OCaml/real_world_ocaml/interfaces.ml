(* Implementation details of a module can be hidden by attaching an interface. 
   A module defined by filename.ml can be constrained by a signature placed in a file called filename.mli 
*)

(* For counter.mli, write down an interface that describes what's currently available
   val touch : (string * int) list -> string -> (string * int) list;;
*)


(* to hide that frequency counts are represented as association lists, make the type of frequency counts abstract *)
type t

(* empty set of frequency counts *)
val empty : t

(* Bump the frequency count for a given string *)
val touch : t -> string -> t

(* Converts the set of frequency counts to an association list *)
val to_list : t -> (string * int) list