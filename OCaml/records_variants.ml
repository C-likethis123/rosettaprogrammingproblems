(* Defining your own data types *)
type point2d = { x: float, y: float };
let p = {x = 3., y = -4 };; (* type point2d*)

(* Record pattern matching *)
let magnitude { x = x_pos; y = y_pos } =
  Float.sqrt (x_pos **. 2. +. y_pos **. 2.);;
(* val magnitude : point2d -> float = <fun> *)

(* Field punning *)
let magnitude { x; y } =
  Float.sqrt (x **. 2. +. y **. 2.);;
(* val magnitude : point2d -> float = <fun> *)

(* To combine multiple obects of these types as a multi-objec scene, represent them as a variant type *)
type scene_element = 
| Circle of circle_desc
| Rect of rect_desc
| Segment of segment_desc

(* Usage of variant type *)
let is_inside point element =
  let open Float.O in
  match element with
  | Circle { center; radius } -> (* code *)
  | Rect { lower_left; width; height }
  | Segment -> false;;

(* Anonymous functions *)
List.exists scene
~f:(fun el -> is_inside_scene_element point el);;