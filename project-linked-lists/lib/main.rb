require_relative 'linked_list'

linked_list = LinkedList.new

puts "Node list : #{linked_list.to_s}"
linked_list.append('amrit')
linked_list.append('amrit1')
linked_list.append('amrit2')
linked_list.append('amrit3')
linked_list.append('amrit4')
print "After append() "
puts "Node list : "+linked_list.to_s
linked_list.prepend('should be at the start')
print "After prepend() "
puts "Node list : #{linked_list.to_s}"
print "\n"
puts "List size : #{linked_list.size}"
puts "Head (value) : #{linked_list.head}"
puts "Tail (value) : #{linked_list.tail}"
puts "Node at index 4 (value) : #{linked_list.at(4)}"
linked_list.pop
puts "After pop()"
puts "Node list : #{linked_list.to_s}"

puts "Does the list contains? ('amrit') : #{linked_list.contains?('amrit')}"
puts "Does the list contains? ('ruby') : #{linked_list.contains?('ruby')}"

puts "What index is ('amrit') located at : #{linked_list.find('amrit')}"
puts "What index is ('ruby') located at : #{linked_list.find('ruby')}"

puts "Node list : #{linked_list.to_s}"