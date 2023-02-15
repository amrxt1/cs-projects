require_relative 'node'

class LinkedList
    attr_accessor :head
    def initialize
        @head = nil
    end

    def append(value)
        (return @head = Node.new(value)) if (@head.nil?)
        current = @head
        current = current.next_node until current.next_node.nil?
        current.next_node = Node.new(value)
    end

    def prepend(value)
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node
    end

    def size
        return 0 if @head.nil?
        current, length = @head, 1
        until current.next_node.nil?
            length += 1
            current = current.next_node
        end
        length
    end

    def head
        @head.value
    end

    def tail
        self.at(self.size)
    end

    def at(index, return_obj = false)
        current,i = @head, 1
        until i == index
            current = current.next_node
            i+=1
        end
        return_obj ? current : current.value
    end

    def pop
        (self.at(self.size - 1, true)).next_node = nil
    end

    def contains? value_to_find
        current = @head
        until current.next_node.nil?
            return true if current.value == value_to_find
            current = current.next_node
        end
        false
    end

    def find(value_to_find)
        current,depth = @head,1
        until current.next_node.nil?
            return depth if current.value == value_to_find
            current = current.next_node
            depth += 1
        end
        "not-in-list"
    end

    def to_s
        return 'head -> nil' if @head.nil?
        current, str = @head, 'head -> '
        until current.next_node.nil?
            tmp = "(#{current.value}) -> "
            str << tmp
            current = current.next_node
        end
        str << "(#{current.value}) -> "
        str << "nil"
    end

end