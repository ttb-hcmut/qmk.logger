type%cstruct [@host_endian] timeval =
  { a : int64_t; b : int64_t }

type%cstruct [@host_endian] input_event =
  { type_ : uint16_t; code : uint16_t; value : int32_t }

module Buf_read =
  struct open Eio.Buf_read

  let input_event : _ parser = fun it ->
    let sizeof_this = sizeof_timeval + sizeof_input_event in
    let buffer = Cstruct.sub (
      ensure it sizeof_this; let v = peek it in consume it sizeof_this; v) 0 sizeof_this in
    let buffer_0 = Cstruct.sub buffer 0 sizeof_timeval
    and buffer_1 = Cstruct.sub buffer sizeof_timeval sizeof_input_event in
    ((get_timeval_a buffer_0, get_timeval_b buffer_0),
      get_input_event_type_ buffer_1, get_input_event_code buffer_1, get_input_event_value buffer_1 )

  let input_events : _ parser = fun it ->
    Seq.forever (fun () -> input_event it)

  end

module Input =
  struct open Eio

  (** abstracts over the filesystem, that's why we overload [Path.with_open_in] *)
  let with_open_in fs name =
    let path = Path.(fs / "/dev" / "input" / name) in
    Path.with_open_in path

  end

