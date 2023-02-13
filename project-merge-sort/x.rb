arr = [3,17]
divide = arr.length/2
puts "array : #{arr} length : #{arr.length} divide : #{divide}"
#divide into left and sort
arr_left = arr[0..divide]
arr_left = [arr[0]] if arr.length == 2

(divide += 1) if (arr.length).odd?

#divide into right and sort
arr_right = arr[divide..-1]

p [arr_left,arr_right]