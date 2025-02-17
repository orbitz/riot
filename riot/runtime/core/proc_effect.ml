open Util

type _ Effect.t += Receive : { ref : unit Ref.t option } -> Message.t Effect.t
  [@@unboxed]

type _ Effect.t += Yield : unit Effect.t [@@unboxed]

type _ Effect.t +=
  | Syscall : {
      name : string;
      mode : [ `r | `w | `rw ];
      fd : Fd.t;
    }
      -> unit Effect.t
  [@@unboxed]
