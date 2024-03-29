(* Let's define two functions working with strings:

last_character that returns the last character of a string, assuming that the string argument is not empty;
string_of_bool that converts a boolean value to its string representation. *)

let last_character str = 
  str.[(String.length str) - 1]
;;

let string_of_bool = function
  | true -> "true" 
  | false -> "false";;

  