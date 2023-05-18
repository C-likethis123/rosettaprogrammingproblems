(* 
   Opening modules - the more modules opened, the fewer module qualifications you need, the harder it is to figure out hwere values come from.
   1. Only open modules that were designed to be opened, like Base or Option.Monad_infix
   2. Prefer local opens
   3. Use module shortcuts (giving a shorter alias to module names) in local scopes (not global scopes!)
*)

(* 
   Including modules - a way of extending modules.
*)

(* 
  Common errors:
  1. Type mismatches
  2. Missing definitions
  3. Type definition mismatches
  4. Cyclic dependencies between modules and files   
*)

(* 
   Designing modules
   1. Expose concrete types rarely 
   - abstractions allow you to enforce variants on your types.
   - exposing types concretely makes it possible to use pattern-matching with those types
   - only use concrete implementation when there is significant value in the ability to pattern match, and when the invariants are already enforced by the data type itself.

   2. Design for the call site
   - names that have a short scope should be short, names with a longer scope should be more descriptive.
   - making APIs more explicit makes them more verbose as well
   - rarely used names should be longer and more explicit, as cost of verbosity goes down, and the benefit of explictness goes up

   3. Create uniform interfaces
   - interfaces of codebases should play together harmoniously
   - guidelines for Base, Core:
    - a module for every time. The primary type of a given module should be called t.
    - put t first: the functions in a module that take a value of M.t should take it as their first argument
    - functions that routinely throw an exception should end in _exn. Otherwise, errors should be signalled by returning an option or an Or_error.t
    - the signature for map is always essentially the same

    4. Interfaces before implementations
*)