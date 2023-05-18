(* 
Suppose that a variable word exists and is a string.

Define a variable sentence that uses 5 string concatenations to create a string containing 9 times word, separated by commas (',').

This time, experiment with defining local let ... ins to store the partial results.
*)
let sentence =
  let word_3 = 
    let word_2 = 
      let word1 = "," ^ word
      in (word1 ^ word1)
    in word_2 ^ word_2
  in word ^ (word_3 ^ word_3)
;;