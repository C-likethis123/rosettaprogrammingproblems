(* Suppose that a variable x exists and is an integer.

Define a variable x_power_8 that uses three multiplications to calculate x to the power of 8. The only function you are allowed to call is the * operator.

Hint: use auxiliary variables. *)
 
(* Answer *)
let x_power_8 = 
  let x_4 = 
    let x_2 = x * x 
    in x_2 * x_2 
  in x_4 * x_4;;

(* If other functions were allowed - using pipes *)
let square x = x * x;
let x_power_8 = 
  x
  |> square
  |> square
  |> square
;;

(* writing a general function *)
let x_power_8 =
  let square x = function
    | 0 -> x
    | _ -> square (x * x) (n - 1)
  in square x n