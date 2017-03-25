class BinaryTree
  def initialzie
    @root = nil
  end

  def add(value)
    if @root == nil
      @root = Node.new(value)
    else
      @root.add(value)
    end
    self
  end

  class Node
    def initialize(value)
      @value = value
      @left_node = nil
      @right_node = nil
    end

    def add(value)
      if value == @value
        # nop
      elsif value < @value
        add_to_left(value)
      else
        add_to_right(value)
      end
    end

    private
      def add_to_left(value)
        if @left_node == nil
          @left_node = Node.new(value)
        else
          @left_node.add(value)
        end
      end

      def add_to_right(value)
        if @right_node == nil
          @right_node = Node.new(value)
        else
          @right_node.add(value)
        end
      end
  end
end
