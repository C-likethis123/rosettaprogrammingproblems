(* Bind *)
let bind option ~f = 
  match option with 
  | None -> None
  | Some x -> f x;;

(* Bind can be used to sequence together error-producing functions so that the first one to produce an error terminates the computation *)
(* Idea: take a first element and last element and return bounds *)
let compute_bounds ~compare list =
  let sorted = List.sort ~compare list in
  Option.bind (List.hd sorted) ~f:(fun first ->
    Option.bind (List.last sorted) ~f:(fun last -> 
      Some (first, last)));;

(* We can use the infix operator form of bind - this is similar to piping, but it's piping of monads. *)
let compute_bounds ~compare list =
  let open Option.Monad_infix in
  let sorted = List.sort ~compare list in
  List.hd sorted >>= fun first ->
  List.last sorted >>= fun last ->
  Some (first, last);;

(* We can use a syntax for monadic binds. let%bind = some_expr is rewritten into some_expr >>= fun x -> some_other_expr *)
let compute_bounds ~compare list =
  let open Option.Let_syntax in
  let sorted = List.sort ~compare list in
  let%bind first = List.hd sorted in
  let%bind last = List.hd last sorted in
  Some (first, last);;

(* We can also use Option.both *)
let compute_bounds ~compare list =
  let sorted = List.sort ~compare list in
  Option.both (List.hd sorted) (List.last sorted);;