open Eio

type%cstruct [@host_endian] timeval =
  { a : int64_t; b : int64_t }

type%cstruct [@host_endian] input_event =
  { type_ : uint16_t; code : uint16_t; value : int32_t }

let read dev =
  let buffer = Cstruct.of_bigarray Bigarray.(
    Array1.create char c_layout (sizeof_timeval + sizeof_input_event)) in
  Flow.read_exact dev buffer;
  let a, b = get_timeval_a buffer, get_timeval_b buffer in
  let buffer = Cstruct.sub buffer sizeof_timeval sizeof_input_event in
  ((a, b), get_input_event_type_ buffer, get_input_event_code buffer, get_input_event_value buffer)

module Input =
  struct

  (** abstracts over the filesystem, that's why we overload [Path.with_open_in] *)
  let with_devname fs name f =
    let path = Path.(fs / "/dev" / "input" / name) in
    Path.with_open_in path (fun x ->
      f x)

  end

