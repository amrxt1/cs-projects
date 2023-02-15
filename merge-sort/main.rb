def merge_sort(arr)
    return arr if arr.length<2
    divide = arr.length/2
    #divide into left and sort
    arr_left = (arr.length == 2) ? Array(arr[0]) : arr[0..divide]
    arr_left = merge_sort(arr_left)    
    #divide into right and sort
    (divide += 1) if (arr.length).odd?
    arr_right = arr[divide..-1]
    arr_right = merge_sort(arr_right)
    #merge
    merge_arrays((arr_left),(arr_right))
end
def merge_arrays(left, right)    
    arr = []
    left_pointer,right_pointer = 0,0
    total = (left.length + right.length) - 1
    for a in 0..total
        break if (left[left_pointer] == nil) || (right[right_pointer] == nil)
        if (left[left_pointer] > right[right_pointer])
            arr.push(right[right_pointer])
            right_pointer += 1
        else
            arr.push(left[left_pointer])
            left_pointer += 1
        end
    end
    (arr << right[right_pointer..-1]).flatten! if left[left_pointer] == nil 
    (arr << left[left_pointer..-1]).flatten! if right[right_pointer] == nil 
    arr
end

puts "Array to sort : [3,5,2,8,0,11,17]"
puts "After sorting (by merge sort) : [#{merge_sort([3,5,2,8,0,11,17]).join(',')}]"