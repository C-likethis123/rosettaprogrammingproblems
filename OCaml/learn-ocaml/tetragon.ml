type point2d = int * int
type tetragon = point2d * point2d * point2d * point2d

let pairwise_distinct (lup, rup, llp, rlp) =
  let points = [lup; rup; llp; rlp] in
  let is_unique pt rest = List.for_all (fun x -> x <> pt) rest in
  let rec all_distinct = function
  | [] | [_] -> true
  | hd::tail -> is_unique hd tail && all_distinct tail
in all_distinct points



