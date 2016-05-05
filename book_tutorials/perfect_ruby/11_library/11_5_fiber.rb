require 'fiber'
# Fiber#alive? の動作を確認する

fr = Fiber.new { Fiber.yield }

p fr.alive? # => true

fr.resume

# yieldによって戻っってきたため、まだfiberは完了していない
p fr.alive? # => true

fr.resume

p fr.alive? # => false