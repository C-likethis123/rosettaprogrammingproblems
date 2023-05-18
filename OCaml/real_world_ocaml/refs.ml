(* We can create a single mutable value using a ref. it is a record type with a single mutable field called contents *)
let x = ref 0;

let y = !x; (* accessing the contents of a ref *)

(* refs can be reimplemented *)
type 'a ref = { mutable contents: 'a };;
let ref x = { contents = x };;
let (!) r = r.contents;;
let (:=) r x = r.contents <- x;;
(* after redefining: *)
let sum list =
  let sum = ref 0 in
  List.iter list ~f(fun x -> sum := !sum + x);
  !sum;;