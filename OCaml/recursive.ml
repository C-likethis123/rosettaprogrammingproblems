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