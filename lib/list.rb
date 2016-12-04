require_relative 'node'

module List
  # The list.
  class List
    attr_reader :count, :type, :start

    def initialize(type)
      @count = 0
      @start = nil
      @type = type
    end

      def add_last(element)
        raise 'Nieprawdidlowy element' if element.class != @type
        @count += 1
        index = 0
        if @start.nil?
          @start = Node.new(element)
          return index
        end
        current = @start
        until current.next.nil?
          current = current.next
          index += 1
        end
        current.next = Node.new(element)
        index++
        index
      end

      def add_first(element)
        raise 'Nieprawdidlowy element' if element.class != @type
        @count += 1
        if @start.nil?
          @start = Node.new(element)
          return
        end
        temp = @start
        @start = Node.new(element)
        @start.next = temp
        nil
      end

      def add_at(element, index)
        raise 'Nieprawdidlowy element' if element.class != @type
        raise 'Nieprawidlowy index' if !index.is_a?(Fixnum) || index > count || index < 0
        if index == count
          add_last(element)
          return
        end
        @count += 1
        current = @start
        (index - 1).times { current = current.next }
        temp = current.next
        current.next = Node.new(element)
        current.next.next = temp
        nil
      end

      def remove(element)
        raise 'Nieprawdidlowy element' if element.class != @type
        return if count.zero?
        current = @start
        if current.node == element
          @start = current.next
          @count -= 1
          return
        end
        return if current.next.nil?
        current = current.next while !current.next.nil? && current.next.node != element
        return if current.nil?
        current.next = current.next.next
        @count -= 1
        nil
      end

      def remove_at(index)
        raise 'Nieprawidlowy index' if !index.is_a?(Fixnum) || index >= count || index < 0
        @count -= 1
        current = @start
        (index - 1).times { current = current.next }
        current.nil? && return
        current.next = current.next.next
        nil
      end

      def get_at(index)
        raise 'Nieprawidlowy index' if !index.is_a?(Fixnum) || index >= count || index < 0
        current = @start
        index.times { current = current.next }
        current.node
      end

      def get_index(element)
        raise 'Nieprawdidlowy element' if element.class != @type
        return -1 if count.zero?
        current = @start
        index = 0
        return 0 if current.node == element
        while !current.next.nil? && current.node != element
          current = current.next
          index += 1
        end
        return index if current.node == element
        -1
      end
    end
end
