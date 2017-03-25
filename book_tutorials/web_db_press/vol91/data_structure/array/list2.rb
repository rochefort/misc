class Element
  attr_accessor :value, :next_ref

  def initialize(value, next_ref)
    @value = value
    @next_ref = next_ref
  end
end

d = Element.new(4, nil)
c = Element.new(3, d)
b = Element.new(2, c)
a = Element.new(1, b)

p a.value
p a.next_ref.value
p a.next_ref.next_ref.value
p a.next_ref.next_ref.next_ref.value
