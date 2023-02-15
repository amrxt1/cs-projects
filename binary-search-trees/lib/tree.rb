require_relative 'node'
require 'pry-byebug'
class Tree
    attr_accessor :arr, :root
    def initialize(array)
        arr = array.sort.uniq
        @root = build_tree(arr)
    end

    def build_tree(arr)
        #base cases : return null if start > end
        return Node.new(arr[0]) if 2 > arr.length
        if arr.length == 2
            #[5,6]
            return Node.new(arr[0],nil,Node.new(arr[1]))
        end
        
        #turn into balanced binary tree recursively
    
        #pick middle as midpoint
        mid = arr.length / 2
    
        #use rootpoint as rooot
        root = arr[mid]
    
        #divide into left and send to build_tree()
        arr_left = arr[0..(mid - 1)]
        left = build_tree(arr_left)
    
        #divide into right and send to build_tree()
        arr_right = arr[(mid+1)..]
        right = build_tree(arr_right)
    
        #convert into Node object
        return Node.new(root,left,right)
    end

    def insert(value, node = @root)
        return "already-in-list" if node.data == value
        if value > node.data
            node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
        else
            node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
        end
    end
    def find(value, node = @root)
        return node if node.nil? || node.data == value 
        if value < node.data
            node.left = find(value, node.left)
        elsif value > node.data
            node.right = find(value, node.right)
        end
    end

    def delete(value, node = root)
        return node if node.nil?

        if value < node.data
            node.left = delete(value, node.left)
        elsif value > node.data
            node.right = delete(value, node.right)
        else
            return node.right if node.left.nil?
            return node.left if node.right.nil?

            leftmost_node = leftmost_leaf(node.right)
            node.data = leftmost_node.data
            node.right = delete(leftmost_node.data, node.right)
        end
        node
    end

    def leftmost_leaf(node = @root)
        node = node.left until node.left.nil?
        node
    end

    def print_pretty(node = root, prefix = '', is_left = true)
        print_pretty(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        print_pretty(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def level_order(node = @root, queue = [])
        print "#{node.data} "
        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
        
        queue.empty? ? return : nil

        level_order(queue.shift, queue)
    end
    
    def preorder(node = @root, order = [],&block)
        #base case : node is nil
        return if node.nil?
        #recursive case
        order.push((block_given?) ? (yield node) : node.data)
        order.push(preorder(node.left)) if node.left
        order.push(preorder(node.right)) if node.right
        order.flatten
    end
    def inorder(node = @root, order = [], &block)
        #base case : node is nil
        return if node.nil?
        #recursive case
        order.push(inorder(node.left)) if node.left
        order.push((block_given?) ? (yield node) : node.data)
        order.push(inorder(node.right)) if node.right
        order.flatten
    end
    def postorder(node = @root, order = [], &block)
        #base case : node is nil
        return if node.nil?
        #recursive case
        order.push(postorder(node.left)) if node.left
        order.push(postorder(node.right)) if node.right
        order.push((block_given?) ? (yield node) : node.data)
        order.flatten
    end
    def height(node = @root, height = 0)
        #base case : nil
        return if node.nil?
        return height if [node.left.nil?, node.right.nil?].all?

        height += 1 unless [node.left.nil?, node.right.nil?].all?
        #binding.pry
        #recursive case : calculate left edges and right edges pick the bigger one
        left_edges = height(node.left, height)
        right_edges = height(node.right, height)
        return right_edges if left_edges.nil?
        return left_edges if right_edges.nil?
        height = left_edges > right_edges ? left_edges : right_edges
    end

    def depth(node = @root)
        return (self.height() - self.height(node))
    end

    def balanced?
        diff = self.height(@root.left) - self.height(@root.right)
        diff <= 1 ? true : false
    end

    def rebalance
        puts "Rebalancing tree..."
        sleep 0.7
        rebalanced_tree = Tree.new((self.inorder))
        self.root = rebalanced_tree.root
    end
end
