require_relative 'tree'
require_relative 'node'

puts `clear`
arr = (Array.new(15) { rand(1..100) })
tree = Tree.new(arr)

puts "root"
tree.print_pretty
puts "Is the tree balanced? #{tree.balanced?}"
print "Level order : "
puts "#{tree.level_order}"
puts "Pre-order : #{tree.preorder}"
puts "Post-order : #{tree.postorder}"
puts "In-order : #{tree.inorder}"

puts "\nAdding 7 random numbers to the tree"
sleep 0.7
7.times {tree.insert(rand(1..100))}
tree.print_pretty
balanced = tree.balanced?
puts "Is the tree still balanced? : #{balanced}"
sleep 1
unless balanced
    puts "Time to rebalance the tree"
    tree.rebalance
    tree.print_pretty
    puts "Is it balanced? : #{tree.balanced?}"
else
    puts "It looks like the is no need to rebalance the tree"
end
print "Level order : "
puts "#{tree.level_order}"
puts "Pre-order : #{tree.preorder}"
puts "Post-order : #{tree.postorder}"
puts "In-order : #{tree.inorder}"
