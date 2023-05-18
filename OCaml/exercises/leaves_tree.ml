type a' tree = Empty | Node of 'a * 'a tree * 'a tree;

let rec count_leaves = function
| Empty -> 0
| Node (_, Empty, Empty) -> 1
| Node (_, left, right) -> count_leaves left + count_leaves right;;