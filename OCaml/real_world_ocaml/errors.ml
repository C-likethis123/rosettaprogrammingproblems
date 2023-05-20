(* Error aware return types *)

(* Using the option type can indicate a failure *)
let compute_bounds ~compare list =
  let sorted = List.sort ~compare list in
  match List.hd sorted, List.last sorted with
  | None,_ | _, None -> None
  | Some x, Some y -> Some (x,y);;

(* Errors encountered during computation do not propagate to the return value of the function - is this an error or another valid result? *)
let find_mismatches table1 table2 =
  Hashtbl.fold table1 ~init:[] ~f:(fun ~key ~data mismatches ->
    match Hashtbl.find table2 key with
    | Some data' when data' <> data -> key :: mismatches
    | _ -> mismatches
  );;

(* Encoding errors with the result *)
(* When encoding an error as None, there's nowhere to say anything about the nature of the error. This can be addressed using Result.t *)

module Result : sig
  type ('a, 'b) t = | Ok of 'a
                    | Error of 'b
end

(* We can construct an error like this *)
Error.of_string "something wrong";;

(* Or_error is a Result.t with the Error case specialised to the error.t type *)
Error (Error.of_string "failed!")

(* Using s-expressions - leaves of the expressions are strings *)
(* Error supports operations for transforming errors. It's often useful to augment an error with information about the context of the error, or combine multiple errors later *)
Error.tag
  (Error.of_list [ Error.of_string "Your tires were slashed";
                   Error.of_string "Your windshield was smashed"])
  ~tag: "over the weekend";;
;;


(* Use %message extension *)
 Or_error.error_s
 [%message "Something went wrong" (a:string) (b: string * int list)];;