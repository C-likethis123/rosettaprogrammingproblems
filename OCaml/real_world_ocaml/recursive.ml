(* Recursive functions - the separation between base cases and inductie cases is often done using pattern matching *)
let rec sum l =
  match l with
  | [] -> 0
  | first :: tl -> first + sum tl;;

(* More complicated list patterns *)
let rec remove_sequential_duplicates list =
  match list with
  | [] -> []
  | [first] -> [first]
  | first :: second :: tl -> 
    if first = second then
      remove_sequential_duplicates (second :: tl)
    else
      first :: remove_sequential_duplicates (second :: tl);;

(* Define multiple mutually recursive values using let rec and the 'and' keyword *)
let rec is_even x =
  if x = 0 then true else is_odd (x - 1)
and is_odd x =
  if x = 0 then false else is_even (x - 1);;

(* 
   Why does OCaml distinguish between nonrecursive definitions and recursive definitions 
   - the type inference algorithm needs to know when a set of function definitions are mutually recursive.
   - in the absence of an explicit rec, asssume that a let binding is on recursive and can only build upon previous definitions
   - having a non recursive form makes it easier for function overloading
 *)

(* to pass a negative value, wrap it in parentheses, or it'll treat (-4) as a partial function *)

let min = Int.max 3 (-4);;

(* 
   reverse application operator - it takes a value and a function, and applies the function to the value. it helps to sequence operations, similar to using piping
   importantly there's also partial application.
   note that reverse application operator is also left-associative - group output on the left and pipe that to the right *)
let path = "/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin";;
String.split ~on:':' path
|> List.dedup_and_sort ~compare:String.compare
|> List.iter ~f:print_endline;;

(* without the reverse application operator *)
let split_path = String.split ~on:':' path in
let deduped_path = List.dedup_and_sort ~compare:String.compare split_path in
List.iter ~f:print_endline deduped_path;;

(* @@ is an application operator, useful to avoid many layers of parentheses *)
let y x = f (g (h x));;

(* can be replaced by *)
let y x = f @@ g @@ h x;

(* function keyword - has built in pattern matching *)
let some_or_zero = function
  | Some x -> x
  | None -> 0;;