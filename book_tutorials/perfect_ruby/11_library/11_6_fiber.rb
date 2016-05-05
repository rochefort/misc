require 'fiber'
# Fiber.currentで現在のファイバを取得する

p fr = Fiber.new { Fiber.current }
p fr_current = fr.resume
p fr == fr_current # => true

p Fibrew.current == fr_current
