type basic_color =
  | Black | Red | Green | Yellow | Blue | Magenta | Cyan | White
type weight = Regular | Bold

type extended_color = 
| Basic of basic_color * weight
| RGB of int * int * int
| Gray of int
| RGBA of int * int * int * int

(* let basic_color_to_int = TODO *)
let color_to_int = function
  | Basic (basic_color, weight) -> 
    let base = match weight with
      | Bold -> 8
      | Regular -> 0
    in
    base + basic_color_to_int basic_color
  | RGB (r,g,b) -> 16 + b + g * 6 + r * 36
  | Gray i -> 232 + i;;

let color_print color s =
  printf "%s\n" (color_by_number (color_to_int color) s);;



