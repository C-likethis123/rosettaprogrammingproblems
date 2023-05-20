(* Exceptions are a way to terminate a computation and report an error *)
(* An exception can terminate a computation even if it happens nested somewhere deep within it *)

(* Define our own exceptions *)
exception Key_not_found of string;;

(* TODO: https://dev.realworldocaml.org/error-handling.html *)