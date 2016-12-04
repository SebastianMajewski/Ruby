module List
  # a node
  class Node
    attr_accessor :node, :next

    def initialize(element)
      @node = element
      @next = nil
    end
  end
end
