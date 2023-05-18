(* Determine if two positive integers are coprime. They are coprime if their greatest common divisor equal 1 *)

let coprime x y =
  let gcd x y = 
    if x = y
    then x
    else if x < y
    then gcd y x
    else gcd (x - y) 
  in
  (gcd x y) = 1;;