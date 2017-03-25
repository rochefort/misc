class BinaryTree
  class Node
    def initialize(key, value)
      @key = key
      @value = value
      @left_node = nil
      @right_node = nil
    end

    def set(key, value)
      if key == @key
        @value = value
      elsif key < @key
        set_to_left(key, value)
      else
        set_to_right(key, value)
      end
    end

    def get(key)
      if key == @key
        @value
      elsif key < @key
        get_to_left(key)
      else
        get_to_right(key)
      end
    end

    private
      def set_to_left(key, value)
        if @left_node == nil
          @left_node = Node.new(key, value)
        else
          @left_node.add(key, value)
        end
      end

      def set_to_right(key, value)
        if @right_node == nil
          @right_node = Node.new(key, value)
        else
          @right_node.add(key, value)
        end
      end

      def get_to_left(key, value)
        if @left_node == nil
          nil
        else
          @left_node.get(key)
        end
      end

      def get_to_right(key, value)
        if @right_node == nil
          @right_node = Node.new(key, value)
        else
          @right_node.get(key)
        end
      end
  end
end
