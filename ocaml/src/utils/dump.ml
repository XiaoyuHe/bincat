(** auxilary module to store the correspondence table bewteen taint source id and lvalues *)

type src_t =
  | R of Register.t
  | M of Data.Address.t * int (* the integer is the size in bits of the pointed memory address *)
      
let taint_src_tbl : (Taint.Src.id_t, src_t) Hashtbl.t = Hashtbl.create 5

let clear () =
  Hashtbl.clear taint_src_tbl;;

let string_of_src src =
  match src with
  | R r -> "r-"^(Register.name r)
  | M (a, sz) -> "M("^(Data.Address.to_string a)^","^(string_of_int sz)^")"  
