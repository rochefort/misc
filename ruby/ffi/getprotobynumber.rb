require 'ffi'

module Libc
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  # or ffi_lib 'c'
  # or ffi_lib "/usr/lib/libc.dylib"

  attach_function :getprotobynumber, [:int], :pointer
  # or attach_function :my_func_name, :getprotobynumber, [:int], :pointer

  class Protoent < FFI::Struct
    layout(
      :p_name, :string,
      :p_aliases, :pointer,
      :p_proto, :int
    )
  end
end

protoent = Libc.getprotobynumber(41)
myent = Libc::Protoent.new(protoent)
p myent[:p_name]
