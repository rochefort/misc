require 'ffi'

module LibC
  extend FFI::Library
  ffi_lib 'c'
  attach_function :puts, [:string], :int
end

LibC.puts "Hello!"
