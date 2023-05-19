(* 
   A record is a collection of values stored together as one. Each component is identified by a different field name.
*)

type service_info =
{
  service_name : string;
  port : int;
  protocol : string;
}

(* To use this type: create a "constructor". The constructor can infer that the function returns a value of type service_info
   Inference is most straightforward when each field name belongs to only one record type
*)
let service_info_of_string line =
  let matches =
    let pat = "[a-z]+" in
    Re.exec (Re.Posix compile_pat pat) line
  in
  {
    service_name = Re.Group.get matches 1;
    port = Int.of_string (Re.Group.get matches 2);
    protocol = Re.Group.get matches 3;
  }
;;

(* Extracting elements from a record *)
let ssh = service_info_of_string "ssh 22/udp # SSH Remote Login Protocol";;
ssh.port;; (* 22 *)

(* Parameterised records *)
type 'a with_line_num = { item: 'a; line_num: int }

(* Use a pattern match to get information out of a record *)

(* Reusing field names can lead to some ambiguity. 
   - Use type annotations
   - Use non overlapping field names
   - Put different record types in different modules
 *)
type log_entry =
  { session_id: string;
    time: Time_ns.t;
    important: bool;
    message: string;
  }
type heartbeat =
  { session_id: string;
    time: Time_ns.t;
    status_message: string;
  }
type logon =
  { session_id: string;
    time: Time_ns.t;
    user: string;
    credentials: string;
  }

let get_session_id t = t.session_id; (* OCaml will pick the most recent definition of the record field and assign it to the type *)


(* Functional updates - imagine we want to create new records that only differs slightly from existing fields *)

type client_info =
  { addr: Core_unix.Inet_addr.t;
    port: int;
    user: string;
    credentials: string;
    last_heartbeat_time: Time_ns.t; (* only this was changed *)
}

(* Define a function for updating client information *)
let register_heartbeat t hb = 
  {
    addr = t.addr;
    port = t.port;
    user = t.user;
    credentials = t.credentials;
    last_heartbeat_time = hb.Heartbeat.time;
  };;

(* More terse - 'with' marks it as a functional update *)
let register_heartbeat t hb =
  { t with last_heartbeat_time = hb.Heartbeat.time };;

(* Mutable fields - records are immutable by default. Declare individual records as mutable *)
type client_info =
  { addr: Core_unix.Inet_addr.t;
    port: int;
    user: string;
    credentials: string;
    mutable last_heartbeat_time: Time_ns.t;
    mutable last_heartbeat_status: string;
  }

(* side effect version of register heartbeat *)
let register_heartbeat t (hb:Heartbeat.t) =
  t.last_heartbeat_time <- hb.time;
  t.last_heartbeat_status <- hb.status_message;

(* First class fields *)
(* Accessor functions is a common pattern - ppx_fields_conv does that *)

module Logon = struct
  type t =
  {
    session_id: string;
    time: Time_ns.t;
    user: string;
    credentials: string;
  }
  [@@deriving fields] (* generates a lot of helper fields *)
end

(* fields can generate accessor functions and a submodule called Fields.
   Fields contain a first class representive of each field, in the form of a value of type Field.t.
   It provides:
   - name
   - get: returns contents of a field
   - fset: functional update
   - setter: None if it's not mutable, Some f if it is
 *)
Field.get Logon.Fields.user;

(* Writing a generic function for displaying a record field *)
let show_field field to_string record =
  let name = Field.name field in
  let field_string = to_string (Field.get field record) in
  name ": " ^ field_string;;

(* Printing out all fields of a Logon record *)
let print_logon logon =
  let print to_string field =
    printf "%s\n" (show_field field to_string logon)
  in
  Logon.Fields.iter
    ~session_id:(print Fn.id)
    ~time:(print Time_ns.to_string)
    ~user:(print Fn.id)
    ~credentials:(print Fn.id);;
val print_logon : Logon.t -> unit = <fun>
print_logon logon;;
(* session_id: 26685
time: 2017-07-21 15:11:45.000000000Z
user: yminsky
credentials: Xy2d9W
- : unit = () *)

(* Helps to adapt the code when fields of a record change *)